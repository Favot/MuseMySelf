class Topic < ApplicationRecord
  has_many :journeys

  # validation really ligth only to check the seed are good

  validates :name, presence: true
end
