class Care < ApplicationRecord
  # アソシエーション
  has_many :pet_cares, dependent: :destroy
  belongs_to :default_item
end
