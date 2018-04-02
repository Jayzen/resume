class CreateSocials < ActiveRecord::Migration[5.2]
  def change
    create_table :socials do |t|
      t.string :name
      t.string :url
      t.integer :weight
      t.integer :user_id

      t.timestamps
    end

    add_index :socials, :user_id
  end
end
