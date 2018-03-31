class AddDescriptionToSkill < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :description, :text
    change_column :skills, :name, :string
  end
end
