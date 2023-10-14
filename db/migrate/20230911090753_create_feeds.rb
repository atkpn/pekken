class CreateFeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :feeds do |t|
      t.string :feed_name, null: false
      t.string :maker
      t.integer :classification, null: false
      t.integer :amount
      t.float :calorie
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
