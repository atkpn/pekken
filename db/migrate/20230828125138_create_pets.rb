class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.datetime :birthday
      t.datetime :came_day
      t.string :kind
      t.integer :sex
      t.string :memo

      t.timestamps
    end
  end
end
