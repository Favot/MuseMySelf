class JourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  CATEGORIES = %w[Théâtre Film Audio Peinture Livre]
  TAGS = {
    "Audio" => "audio",
    "Film" => "movie",
    "Théâtre" => "theater",
    "Peinture" => "painting",
    "Livre" => "book"
  }

  def index
    @topics = Topic.all
    @journeys = Journey.all
    @journeys = @journeys.where('name ILIKE ?', "%#{params[:search]['query']}%") if params[:search].present?
    @journeys = @journeys.where(topic_id: params[:topic_id]) if params[:topic_id].present?
    @topic = Topic.where(id: params[:topic_id]) if params[:topic_id].present?
    # 'views/journeys/index.html.erb'
    @journey_suggestions = Journey.all.sample(3)

    # to get journey topic
    @all_journeys_topic = {}
    Journey.all.each do |journey|
      @all_journeys_topic[journey] = journey.topic.name
    end

    # to get journey duration
    @all_journeys_duration = {}
    Journey.all.each do |journey|
      @all_journeys_duration[journey] =
        format_duration(Content.joins(journey_contents: :journey).where(journey_contents: { journey: journey }).sum(&:duration) * 60)
    end
  end

  def show
    @journey = Journey.includes(:contents).find(params[:id])
    @tags = TAGS

    redirect_to user_journey_path(@user_journey) if subscribed?
    # calculations about the journey
    @average_rating = average_rating
    @duration = "#{duration[0]} h #{duration[1]} min"
    @count_subscribers = count_subscribers

    # calculations about the journey contents
    @contents = @journey.contents
    # @contents = this_journey_contents_sorted.reverse.to_a # SQL relation => Array
    @contents_by_type = @journey.contents.group_by(&:category)

    @content_count_by_type = count_by_type
    @contents_durations = this_journey_contents_durations_in_h_and_min

    # calculations about the user, skept if user is not connected yet
    @to_do_count_by_type = current_user_to_do if subscribed?
    @subscribed = subscribed?
  end

  private

  def format_duration(seconds)
    # seconds must be < to 24 hours
    if seconds.zero?
      Time.at(rand(36_000..72_000)).utc.strftime("%Hh")
    # elsif seconds < 3600
    #   Time.at(seconds).utc.strftime("%Mmin")
    else
      Time.at(seconds).utc.strftime("%Hh")
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
    @contents.each do |content|
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
    @user_journey = current_user&.user_journeys&.find_by(journey: @journey)
    return true if user_signed_in? && @user_journey.present?

    false
  end

  def current_user_to_do
    user = User.where(id: current_user).first
    uncomplete_user_journey_contents = user.user_journeys.where(journey: @journey).first
                                           .user_journey_contents.where(completed: false)
    # Content.group(:category).order(:category).count
    count = {}
    CATEGORIES.each do |category|
      count[category.to_s] = uncomplete_user_journey_contents.joins(:content)
                                                             .where("contents.category" => category)
                                                             .size
    end
    count
  end
end
