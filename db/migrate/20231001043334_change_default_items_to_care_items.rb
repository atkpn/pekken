class ChangeDefaultItemsToCareItems < ActiveRecord::Migration[6.1]
  def change
    rename_table :default_items, :care_items do |t|
      t.string :name, null: false
      t.string :unit
      t.boolean :default_item, default: false
    end
  end
end
