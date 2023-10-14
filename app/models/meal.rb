class Meal < ApplicationRecord
  belongs_to :pet
  belongs_to :feed

  # バリデーション
  validates :amount_eaten, presence: true

  # 摂取カロリーを算出
  def calorie_intake
    (amount_eaten * feed.calorie) / feed.amount
  end
end
