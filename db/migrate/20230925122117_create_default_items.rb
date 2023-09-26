class CreateDefaultItems < ActiveRecord::Migration[6.1]
  def change
    create_table :default_items do |t|
      t.string :name, null: false
      t.string :unit

      t.timestamps
    end
  end
end
