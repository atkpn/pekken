class CareItems < ActiveRecord::Migration[6.1]
  def change
    add_column :care_items, :default_item, :boolean, default: false, null: false
    add_column :care_items, :user_id, :integer
  end
end
