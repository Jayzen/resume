class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :weigth
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
