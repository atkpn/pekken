class CreateCares < ActiveRecord::Migration[6.1]
  def change
    create_table :cares do |t|
      t.integer :user_id
      t.integer :default_id
      t.string :custom_item
      t.string :unit

      t.timestamps
    end
  end
end
