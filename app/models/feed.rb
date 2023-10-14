class Feed < ApplicationRecord
  # enum
  enum classification: { meal: 0, snack: 1 }

  # バリデーション
  validates :feed_name, presence: true
  validates :classification, presence: true

  # アソシエーション
  has_many :meals, dependent: :destroy
  has_many :pets, through: :meals
  belongs_to :user
end
