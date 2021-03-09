class Topic < ApplicationRecord
  has_many :journeys
  
  has_one_attached :photo

  # validation really ligth only to check the seed are good
  validates :name, presence: true
end
