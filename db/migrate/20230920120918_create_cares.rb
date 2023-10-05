class CreateCares < ActiveRecord::Migration[6.1]
  def change
    create_table :cares do |t|
      t.integer :care_item_id, null: false
      t.integer :pet_id, null: false

      t.timestamps
    end
  end
end
