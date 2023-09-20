class Care < ApplicationRecord
  # アソシエーション
  has_many :pet_cares, dependent: :destroy
  has_many :pets, through: :petcares
end
