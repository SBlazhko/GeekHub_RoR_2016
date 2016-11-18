class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :autor
      t.integer :pages

      t.timestamps
    end
  end
end
