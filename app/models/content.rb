class Content < ApplicationRecord
  has_many :user_journey_contents

  has_many :journey_contents

  has_one_attached :photo

  # validation really light only to check the seed

  validates :title, presence: true

  validates :author, presence: true

  validates :date, presence: true

  validates :category, presence: true

  validates :duration, presence: true

  validates :url, presence: true

  validates :description, presence: true
end
