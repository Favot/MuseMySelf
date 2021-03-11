class UserJourneysController < ApplicationController
  def create
    @user_journey = UserJourney.new(user_journey_params)
    @journey = Journey.find(params[:journey_id])
    @user_journey.journey = @journey
    @user_journey.user = current_user
    raise
    if @user_journey.save!
      flash[:notice] = 'Vous avez etez enregistrer sur le parcours!'
      redirect_to journey_path(params[:journey_id])
    else
      flash[:alert] = 'Petite probleme!'
      redirect_to journey_path(params[:journey_id])
    end
  end
end
