class Notification < ApplicationRecord
  # アソシエーション
  belongs_to :user

  # バリデーション
  validate :due_date_check
  validates :task, presence: true

  def due_date_check
    errors.add(:due_date, "は現在日時より前の日時で登録できません。") if self.due_date < Time.zone.now
  end
end
