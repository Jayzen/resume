class ChangeColumnInEducation < ActiveRecord::Migration[5.2]
  def change
    change_column :educations, :gpa, :decimal, precision: 5, scale: 2
  end
end
