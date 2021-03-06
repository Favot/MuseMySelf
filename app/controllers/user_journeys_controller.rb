class UserJourneysController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  CATEGORIES = %w[Théâtre Film Audio Peinture Livre]
  TAGS = {
    "Audio" => "audio",
    "Film" => "movie",
    "Théâtre" => "theater",
    "Peinture" => "painting",
    "Livre" => "book"
  }

  def index
    # Get all user_journeys of current user
    @ujs = UserJourney.where(user: current_user)

    # Get journeys of only user_journeys in progress
    @user_journeys_started = current_user.user_journeys.where(completed: false)

    # Get journeys of only user_journeys completed
    @user_journeys_completed = current_user.user_journeys.where(completed: true)

    @user_journeys_favorites = current_user
                               .user_journeys
                               .select("user_journeys.*, avg(rating) as avg_rating")
                               .joins(:user_journey_contents)
                               .group("user_journeys.id")
                               .having("avg(rating) > 4")
                               .order("avg_rating DESC").to_a

    # Get journey topic
    @all_journeys_topic = {}
    Journey.all.each do |journey|
      @all_journeys_topic[journey] = journey.topic.name
    end

    @user_journeys_progress = {}
    user_journeys = UserJourney.includes(:journey, :user_journey_contents, :contents).where(user: current_user)
    user_journeys.each do |user_journey|
      @user_journeys_progress[user_journey] = {}
      @user_journeys_progress[user_journey][:completed] = user_journey.user_journey_contents.where(completed: true).count
      @user_journeys_progress[user_journey][:total] = user_journey.user_journey_contents.count
    end
  end

  def create
    @user_journey = UserJourney.new
    @journey = Journey.find(params[:journey_id])
    @user_journey.journey = @journey
    @user_journey.user = current_user
    @journey_contents = @journey.journey_contents

    if @user_journey.save
      create_user_journey_content(@journey_contents)
      flash[:notice] = 'Vous avez été enregistré sur le parcours !'
      redirect_to user_journey_path(@user_journey)
    else
      flash[:alert] = 'Petit problème ! Vérifiez que vous êtes bien connecté(e).'
      redirect_to journey_path(params[:journey_id])
    end
  end

  def show
    @user_journey = UserJourney.includes(:journey, :user_journey_contents, :contents).find(params[:id])
    @journey = @user_journey.journey
    @tags = TAGS

    # calculations about the journey
    @average_rating = average_rating
    @duration = "#{duration[0]} h #{duration[1]} min"
    @count_subscribers = count_subscribers

    # calculations about the journey contents
    @user_journey_contents         = @user_journey.user_journey_contents.order(position: :asc)
    @user_journey_contents_by_type = @user_journey_contents.group_by { |ujc| ujc.content.category }

    @contents = @user_journey.contents.order(position: :asc)
    # @contents = this_journey_contents_sorted.to_a # SQL relation => Array

    @content_count_by_type = count_by_type
    @contents_durations = this_journey_contents_durations_in_h_and_min

    # calculations about the user, skept if user is not connected yet
    @to_do_count_by_type = current_user_to_do if subscribed?
    @subscribed = subscribed?

    @user_journey_contents_ids = {}
    @user_journey.user_journey_contents.each do |user_journey_content|
      @user_journey_contents_ids[user_journey_content.content] = user_journey_content.id
    end

    # Get content of only user_journey_contents completed
    @user_journey_content_completed = @user_journey.user_journey_contents.select{ |ujc| ujc.completed }

    # Get content of only user_journey_contents not completed
    @user_journey_content_to_do = @user_journey.user_journey_contents.select{ |ujc| !ujc.completed }
  end

  def complete
    if params.present?
      user_journey = UserJourney.find(params[:id])

      user_journey.completed = true

      user_journey.save

      redirect_to journey_path(user_journey.journey_id)
    end
  end

  private

  def create_user_journey_content(journey_contents)
    journey_contents.each do |journey_content|
      UserJourneyContent.create!(
        user_journey: @user_journey,
        content_id: journey_content.content_id,
        position: journey_content.position
      )
    end
  end

  def average_rating
    average_user_journey_contents_rating || "🤷"
  end

  def average_user_journey_contents_rating
    UserJourneyContent
      .joins(user_journey: :journey) # association
      .where(user_journeys: { journey: @journey }) # table
      .average(:rating).to_f.round(1)
  end

  def duration
    duration = this_journey_contents_sorted.sum(&:duration)
    duration.divmod(60) # => [hours, minutes]
  end

  def count_subscribers
    UserJourney.where(journey: @journey).size
  end

  def this_journey_contents_sorted
    Content
      .joins(journey_contents: :journey)
      .where(journey_contents: { journey: @journey })
      .order(position: :desc)
  end

  def this_journey_contents_durations_in_h_and_min
    # we need to calculate durations in hours and minutes and store them in a different variable because they are not \
    # part of the content model
    contents_durations = {}
    @contents.map do |content|
      contents_durations[content] = {}
      contents_durations[content][:hours], contents_durations[content][:minutes] = content.duration.divmod(60)
    end
    contents_durations
  end

  def count_by_type
    @journey_contents = JourneyContent.where(journey: @journey)
    count = {}
    CATEGORIES.each do |category|
      count[category.to_s] = @journey_contents.joins(:content).where("contents.category" => category).size
    end
    count
  end

  def subscribed?
    return true if user_signed_in? && current_user.user_journeys.where(journey: @journey).size >= 1

    false
  end

  def current_user_to_do
    user = User.where(id: current_user).first
    uncomplete_user_journey_contents = user.user_journeys.where(journey: @journey).first
                                           .user_journey_contents.where(completed: false)
    count = {}
    CATEGORIES.each do |category|
      count[category.to_s] = uncomplete_user_journey_contents.joins(:content)
                                                             .where("contents.category" => category)
                                                             .size
    end
    count
  end
end
