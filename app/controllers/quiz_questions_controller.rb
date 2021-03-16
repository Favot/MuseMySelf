class QuizQuestionsController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  def index
    @user_journey_content = UserJourneyContent.find(params[:user_journey_content_id])
    @journey_content = JourneyContent.where(content: @user_journey_content.content.id)
    @quiz_questions = QuizQuestion.where(journey_content: @journey_content)
    @answers = Answer.where(quiz_question: @quiz_questions)

    # @user_answers = UserAnswer.new
    # raise
  end
end
