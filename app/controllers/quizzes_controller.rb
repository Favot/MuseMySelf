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
      @quiz_summary = @quiz_questions.map do |quiz_question|
        {
          question: quiz_question.label,
          correct_answer: quiz_question.correct_answer,
          user_answer: quiz_question.user_answers.find_by(user_journey_content: @user_journey_content)
        }
      end
      # results
      @correct_answers_count = 0
      @comparison = @quiz_summary.map do |element|
        correct_answer = "Bravo, la bonne réponse était #{element[:correct_answer].content} !"
        wrong_answer   = "Tu as répondu #{element[:user_answer].answer.content}, la bonne réponse était #{element[:correct_answer].content} !"
        correction = element[:user_answer].answer.correct ? correct_answer : wrong_answer
        @correct_answers_count += 1 if element[:user_answer].answer.correct
        {
          question:   element[:question],
          correction: correction,
          correct:    element[:user_answer].answer.correct
        }
      end
      # render template for results
      render :results
    else
      render :show
    end
  end
end
