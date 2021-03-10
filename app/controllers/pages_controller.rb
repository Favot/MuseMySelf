class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :components]

  def home
    @topics = Topic.all

    # top 3 journey
    @popular_journeys = Journey.all

    # last 3 journey
    @last_journeys = Journey.all.last(3).reverse

    # 3 randoms journey
    @random_journeys = Journey.all.sample(3)
    # raise
  end

  def components
  end
end
