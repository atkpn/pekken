class BodyInfo < ApplicationRecord
  # アソシエーション
  belongs_to :pet

  # バリデーション
  validates :weight, presence: true
end
