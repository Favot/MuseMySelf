class QuizQuestion < ApplicationRecord
  belongs_to :journey_content
  has_many :answers

  has_many :user_answers, through: :answers

  def correct_answer
    answers.find_by(correct: true)
  end
end
