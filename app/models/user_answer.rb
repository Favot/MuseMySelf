class UserAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :user_journey_content
end
