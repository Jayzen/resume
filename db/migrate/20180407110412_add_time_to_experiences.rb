class AddTimeToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :time, :string
    remove_column :experiences, :datetime, :string
  end
end
