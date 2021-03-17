class JourneyContent < ApplicationRecord
  belongs_to :content
  belongs_to :journey
  has_many :quiz_questions

  # validation really ligth only to check the seed are good

  validates :position, presence: true

  validates :content_id, presence: true

  validates :journey_id, presence: true
end
