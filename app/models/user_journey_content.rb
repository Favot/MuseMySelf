class UserJourneyContent < ApplicationRecord
  belongs_to :content
  belongs_to :user_journey
end
