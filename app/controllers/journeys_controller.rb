class JourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  CATEGORIES = %w[Théâtre Film Audio Peinture Livre]

  def index
    @journeys = Journey.all
    @journeys = @journeys.where('name ILIKE ?', "%#{params[:search]['query']}%") if params[:search].present?
    @journeys = @journeys.where(topic_id: params[:topic_id]) if params[:topic_id].present?
  end

  def show
    @journey = Journey.find(params[:id])

    ratings = this_journey_user_journey_contents.map(&:rating)
    @average = (ratings.sum * 1.0 / ratings.size)

    duration = this_journey_contents_sorted.sum(&:duration)
    h, m = duration.divmod(60)
    @duration = "#{h} h #{m} min"

    @count_subscribers = count_subscribers

    @content_count_by_type = count_by_type

    # skip if user is not connected yet
    # @to_do_count_by_type = current_user_to_do if user_signed_in?
  end

  private

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
    @journey_contents.order(position: :asc).map(&:content)
  end

  def count_by_type
    @journey_contents = JourneyContent.where(journey: @journey)
    count = {}
    CATEGORIES.each do |category|
      count[category.to_s] = @journey_contents.joins(:content).where("contents.category" => category).size
    end
    count
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
