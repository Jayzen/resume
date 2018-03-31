class ChangeSkillColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :skills, :name, :text
  end
end
