class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :remember_digest
      t.string :avatar
      t.string :gender
      t.text :description
      t.string :slug
      t.integer :template, default: 1

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :slug, unique: true
  end
end
