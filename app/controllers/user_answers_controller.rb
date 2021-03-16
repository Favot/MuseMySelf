class UserAnswersController < ApplicationController
  def create
    # get current user_journey_content
    @user_journey_content = UserJourneyContent.find(params[:user_journey_content_id])
    # create user_answer when saving user input
    @user_journey_content.user_answers.destroy_all
    @user_journey_content.update(user_journey_content_user_answers_params)
    redirect_to user_journey_content_quiz_path
  end

  private

  def user_journey_content_user_answers_params
    params.require(:user_journey_content).permit(user_answers_attributes: [:answer_id])
  end
end
