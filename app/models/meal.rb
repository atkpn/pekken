class Meal < ApplicationRecord
  belongs_to :pet
  belongs_to :feed
  
  # 摂取カロリーを算出
  def calorie_intake
    (amount_eaten * feed.calorie) / feed.amount
  end
end
