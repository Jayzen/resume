class AddWeightToSkill < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :weight, :integer
    remove_column :skills, :weigth
  end
end
