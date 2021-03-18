class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :components]

  def home
    @topics = Topic.all

    # top 3 journey
    @all_journeys = Journey.all

    # to get journey topic
    @all_journeys_topic = {}
    @all_journeys.each do |journey|
      @all_journeys_topic[journey] = journey.topic.name
    end

    # last 3 journey
    @last_journeys = Journey.all.last(3).reverse

    # 3 randoms journey
    @random_journeys = Journey.all.sample(3)

    # to get journey duration
    @all_journeys_duration = {}
    Journey.all.each do |journey|
      seconds = Content.joins(journey_contents: :journey).where(journey_contents: { journey: journey }).sum(&:duration) * 60
      @all_journeys_duration[journey] = format_duration(seconds)
    end
  end

  def components
  end
end
