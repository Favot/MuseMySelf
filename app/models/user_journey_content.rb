class UserJourneyContent < ApplicationRecord
  belongs_to :content
  belongs_to :user_journey
  has_many :user_answers

  # validation really ligth only to check the seed are good

  validates :content_id, presence: true

  validates :user_journey_id, presence: true
end
