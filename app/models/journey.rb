class Journey < ApplicationRecord
  belongs_to :topic

  has_many :journey_contents
  has_many :user_journeys
end
