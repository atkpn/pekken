class CreatePetCares < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_cares do |t|
      t.integer :pet_id, null: false
      t.integer :care_id, null: false
      t.string :memo
      t.datetime :date_time, null: false

      t.timestamps
    end
  end
end
