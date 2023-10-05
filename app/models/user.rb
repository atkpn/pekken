class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

  # 退会済み確認
  def active_for_authentication?
    super && (is_deleted == false)
  end

  # アソシエーション
  has_many :pets, dependent: :destroy
  has_many :care_items, dependent: :destroy

end
