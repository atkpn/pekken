class CreateBodyInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :body_infos do |t|
      t.integer :pet_id, null: false
      t.float :length
      t.float :weight
      t.string :memo

      t.timestamps
    end
  end
end
