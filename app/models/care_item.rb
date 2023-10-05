class CareItem < ApplicationRecord
  # アソシエーション
  has_many :cares, dependent: :destroy
  has_many :pets, through: :cares
  belongs_to :user, optional: true #デフォルトの項目にはユーザー情報は紐づかないため
end
