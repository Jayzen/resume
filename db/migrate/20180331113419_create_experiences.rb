class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :position
      t.string :datetime
      t.text :description
      t.integer :weight
      t.integer :user_id

      t.timestamps
    end

    add_index :experiences, :user_id
  end
end
