class UserJourneyContentsController < ApplicationController
  def show
    @user_journey_content = UserJourneyContent.find(params[:id])
    @content = @user_journey_content.content
    @current_journey_id = @user_journey_content.user_journey_id
  end

  def edit
    @user_journey_content = UserJourneyContent.find(params[:id])
    @content = @user_journey_content.content
  end

  def update
    @user_journey_content = UserJourneyContent.find(params[:id])
    @content = @user_journey_content.content

    if @user_journey_content.update(user_journey_content_params)
      redirect_to user_journey_content_path( anchor: "review")
    else
      render :update
    end
  end

  private

  def user_journey_content_params
    params.require(:user_journey_content).permit(:rating, :review, :completed)
  end
end
