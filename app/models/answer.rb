class Answer < ApplicationRecord
  belongs_to :quiz_question
  has_one :user_answer
end
