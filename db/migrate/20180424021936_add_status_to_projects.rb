class AddStatusToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :status, :boolean, default: true
    add_column :papers, :status, :boolean, default: true
    add_column :wechats, :status, :boolean, default: true
    add_column :socials, :status, :boolean, default: true
    add_column :skills, :status, :boolean, default: true
    add_column :pdf_resumes, :status, :boolean, default: true
    add_column :experiences, :status, :boolean, default: true
    add_column :educations, :status, :boolean, default: true
  end
end
