class Pet < ApplicationRecord
  enum sex: {male: 0, female: 1, not_known: 2}
  has_one_attached :image

  # アソシエーション
  belongs_to :user

end
