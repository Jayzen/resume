class AddLanguageToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :socials, :language, :string
    add_column :skills, :language, :string
    add_column :projects, :language, :string
    add_column :experiences, :language, :string
    add_column :educations, :language, :string
  end
end
