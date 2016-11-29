class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :avatar
      t.string :name
      t.string :surname
      t.integer :age
      t.boolean :admin, default: false
      t.string :password_digest

      t.timestamps
    end
  end
end
