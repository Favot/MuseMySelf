class QuizzesController < ApplicationController
  before_action :authenticate_user!, only: %i[show]

  def show
    # get current user_journey_content
    @user_journey_content = UserJourneyContent.find(params[:user_journey_content_id])
    @journey_content = JourneyContent.where(content: @user_journey_content.content.id)
    # get questions related to this content
    @quiz_questions = QuizQuestion.where(journey_content: @journey_content)
    # get possible answers for one question
    @answers = Answer.where(quiz_question: @quiz_questions)

    # dedicated page to show results when users have submitted their answers
    if @user_journey_content.user_answers.any?
      # get data
      @quiz_questions = QuizQuestion.where(journey_content: @journey_content)
      @correct_answers = @answers.where(correct: true)
      @user_answers = @user_journey_content.user_answers
      # store data in arrays then store it in a unique hash
      correct_answers = []
      @correct_answers.each do |correct_answer|
        correct_answers << correct_answer.content
      end
      # store data in arrays then store it in a unique hash
      user_answers = []
      @user_answers.each do |user_answer|
        user_answers << user_answer.answer.content
      end
      # store data in a unique hash
      @comparison = {
        correct_answers: correct_answers,
        user_answers: user_answers
      }
      # render template for results
      render :results
    else
      render :show
    end
  end
end
