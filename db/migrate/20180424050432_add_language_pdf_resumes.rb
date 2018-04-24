class AddLanguagePdfResumes < ActiveRecord::Migration[5.2]
  def change
    add_column :pdf_resumes, :language, :string
  end
end
