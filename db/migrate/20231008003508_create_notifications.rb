class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id, null: false
      t.string :user_uid, null: false
      t.string :task, null: false
      t.datetime :due_date, null: false

      t.timestamps
    end
  end
end
