class UserJourney < ApplicationRecord
  belongs_to :user
  belongs_to :journey

  #  call when we call a user journey content we want also access to the content link ot it.
  has_many :user_journey_contents
  has_many :contents, through: :user_journey_contents
end
