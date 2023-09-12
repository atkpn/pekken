class Feed < ApplicationRecord
  # enum
  enum classification: { meal: 0, snack: 1 }

  # アソシエーション
  has_many :meals, dependent: :destroy
  has_many :pets, through: :meals
end
