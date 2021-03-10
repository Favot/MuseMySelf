class JourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @journeys = Journey.all

    if params[:search].present?
      @journeys = @journeys.where('name ILIKE ?', "%#{
            params[:search]['query']}%")

    end

    @journeys = @journeys.where(topic_id: params[:topic_id]) if params[:topic_id].present?
  end
end
