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
    @last_journeys = Journey.all.last(5).reverse

    # 3 randoms journey
    @random_journeys = Journey.all.sample(7)

    # to get journey duration
    @all_journeys_duration = {}
    Journey.all.each do |journey|
      seconds = Content.joins(journey_contents: :journey).where(journey_contents: { journey: journey }).sum(&:duration) * 60
      @all_journeys_duration[journey] = [format_duration(seconds), rand(50..300), rand(39..49).fdiv(10)]
    end
  end

  def components
  end

  private

  def format_duration(seconds)
    # seconds must be < to 24 hours
    if seconds.zero?
      Time.at(rand(10_000..72_000)).utc.strftime("%kh")
    # elsif seconds < 3600
    #   Time.at(seconds).utc.strftime("%Mmin")
    else
      Time.at(seconds).utc.strftime("%kh")
    end
  end
end
