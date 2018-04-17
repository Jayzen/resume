class RemoveLanguageFromSocials < ActiveRecord::Migration[5.2]
  def change
    remove_column :socials, :language, :string
  end
end
