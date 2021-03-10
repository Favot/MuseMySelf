class JourneysController < ApplicationController
  CATEGORIES = %w[Théâtre Film Audio Peinture Livre]

  # def index
  #   @journeys = Journey.all

  #   if params[:search].present?
  #     @journeys = @journeys.where('name ILIKE ?', "%#{
  #           params[:search]}%")
  #   end

  #   @journeys = @journeys.where(topic_id: params[:topic_id]) if params[:topic_id].present?
  # end

  def show
    @journey = Journey.find(params[:id])

    ratings = this_journey_user_journey_contents.map(&:rating)
    @average = (ratings.sum * 1.0 / ratings.size)

    duration = this_journey_contents_sorted.sum(&:duration)
    h, m = duration.divmod(60)
    @duration = "#{h} h #{m} min"

    @subscribed = count_subscribers
    @count = count_by_type
  end

  private

  def count_subscribers
    UserJourney.where(journey: @journey).size
  end

  def this_journey_user_journey_contents
    # Get all the user_journeys where the journey is this one
    @user_journeys = UserJourney.where(journey: @journey)
    # For each user_journeys get all the user_journey_contents and store them
    ujc = []
    @user_journeys.each do |user_journey|
      user_journey.user_journey_contents.each do |user_journey_content|
        ujc << user_journey_content
      end
    end
    return ujc
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
end
