class CreateWeixins < ActiveRecord::Migration[5.2]
  def change
    create_table :weixins do |t|
      t.string :pic

      t.timestamps
    end
  end
end
