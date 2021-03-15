class QuizQuestion < ApplicationRecord
  belongs_to :journey_content
  has_many :answers
end
