class CareItem < ApplicationRecord
  # バリデーション
  validates :name, presence: true

  # アソシエーション
  has_many :cares, dependent: :destroy
  has_many :pets, through: :cares
  belongs_to :user, optional: true #デフォルトの項目にはユーザー情報は紐づかないため
end
