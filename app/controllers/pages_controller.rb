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
  end

  def components
  end
end
