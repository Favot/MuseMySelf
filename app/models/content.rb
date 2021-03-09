class Content < ApplicationRecord
  has_many :user_journey_contents

  has_many :journey_contents
end
