class Care < ApplicationRecord
  # アソシエーション
  has_many :pet_cares, dependent: :destroy
  belongs_to :pet
  belongs_to :care_item
end
