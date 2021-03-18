class Journey < ApplicationRecord
  belongs_to :topic

  has_many :journey_contents
  has_many :user_journeys

  has_many :contents, through: :journey_contents

  has_one_attached :photo
  # validation really ligth only to check the seed are good

  validates :name, presence: true
  validates :summary, presence: true
  validates :topic_id, presence: true
end
