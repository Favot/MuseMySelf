class UserJourneysController < ApplicationController
  CATEGORIES = %w[Théâtre Film Audio Peinture Livre]
  before_action :authenticate_user!, only: %i[index]

  def index
    # Get all user_journeys of current user
    @ujs = UserJourney.where(user: current_user)

    # Get only user_journeys in progress
    @ujs_started = @ujs.where(completed: false)
    # Get journeys of only user_journeys in progress
    @user_journeys_started = []
    @ujs_started.each do |uj_started|
      @user_journeys_started << uj_started.journey
    end
    # Get topics of journeys of only user_journeys in progress
    @user_journeys_started_topic = {}
    @user_journeys_started.each do |uj|
      @user_journeys_started_topic[uj] = uj.topic.name
    end

    # Get only user_journeys completed
    @ujs_conpleted = @ujs.where(completed: true)
    # Get journeys of only user_journeys completed
    @user_journeys_conpleted = []
    @ujs_conpleted.each do |uj_completed|
      @user_journeys_conpleted << uj_completed.journey
    end
    # Get topics of journeys of only user_journeys completed
    @user_journeys_conpleted_topic = {}
    @user_journeys_conpleted.each do |uj|
      @user_journeys_conpleted_topic[uj] = uj.topic.name
    end
    # raise
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
      redirect_to user_journey_path(params[:journey_id])
    else
      flash[:alert] = 'Petit problème !'
      redirect_to journey_path(params[:journey_id])
    end
  end

  def show
    @journey = Journey.find(params[:id])
    # calculations about the journey
    @average_rating = average_rating
    @duration = "#{duration[0]} h #{duration[1]} min"
    @count_subscribers = count_subscribers

    # calculations about the journey contents
    @contents = this_journey_contents_sorted.to_a # SQL relation => Array
    @content_count_by_type = count_by_type
    @contents_durations = this_journey_contents_durations_in_h_and_min

    # calculations about the user, skept if user is not connected yet
    @to_do_count_by_type = current_user_to_do if subscribed?
    @subscribed = subscribed?
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

  def ratings
    this_journey_user_journey_contents.map(&:rating).compact
  end

  def average_rating
    return (ratings.sum * 1.0 / ratings.size) if ratings.size.positive?

    "🤷" # if no ratings. Not best practice, but fun
  end

  def duration
    duration = this_journey_contents_sorted.sum(&:duration)
    duration.divmod(60) # => [hours, minutes]
  end

  def count_subscribers
    UserJourney.where(journey: @journey).size
  end

  def this_journey_user_journey_contents
    # Get all the user_journeys where the journey is this one
    @user_journeys = UserJourney.where(journey: @journey)
    # For each user_journeys get all the user_journey_contents and store them
    user_journey_contents = []
    @user_journeys.each do |user_journey|
      user_journey.user_journey_contents.each do |user_journey_content|
        user_journey_contents << user_journey_content
      end
    end
    user_journey_contents
  end

  def this_journey_contents_sorted
    @journey_contents = JourneyContent.where(journey: @journey)
    @journey_contents.order(position: :asc).map(&:content).map
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
    return true if user_signed_in? && current_user.user_journeys.where(journey: @journey).size == 1

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
