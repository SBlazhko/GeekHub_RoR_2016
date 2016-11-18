class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.integer :flors
      t.integer :price
      t.integer :square

      t.timestamps
    end
  end
end
