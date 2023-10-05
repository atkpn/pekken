class Pet < ApplicationRecord
  enum sex: { male: 0, female: 1, not_known: 2 }
  has_one_attached :pet_image

  def get_pet_image(width, height)
    unless pet_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_square.jpg')
      pet_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    pet_image.variant(resize_to_limit: [width, height]).processed
  end

  # アソシエーション
  belongs_to :user
  has_many :body_infos, dependent: :destroy
  has_many :meals, dependent: :destroy
  has_many :feeds, through: :meals
  has_many :cares, dependent: :destroy
  has_many :care_items, through: :cares


end
