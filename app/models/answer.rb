class Answer < ApplicationRecord
  belongs_to :quiz_question
  has_many :user_answers
end
