class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name_en, :string
    add_column :users, :city_en, :string
    add_column :users, :description_en, :string
  end
end
