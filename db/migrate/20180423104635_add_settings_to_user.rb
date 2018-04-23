class AddSettingsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :has_social, :boolean, default: true
    add_column :users, :has_project, :boolean, default: true
    add_column :users, :has_education, :boolean, default: true
    add_column :users, :has_skill, :boolean, default: true
    add_column :users, :has_experience, :boolean, default: true
    add_column :users, :has_paper, :boolean, default: true
    add_column :users, :has_pdf_resume, :boolean, default: true
  end
end
