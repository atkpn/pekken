class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.integer :pet_id, null: false
      t.integer :feed_id, null: false
      t.float :amount_eaten, null: false
      t.datetime :datetime, null: false

      t.timestamps
    end
  end
end
