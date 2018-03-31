class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :school
      t.string :degree
      t.string :major
      t.string :gpa
      t.string :time
      t.integer :weight

      t.timestamps
    end
  end
end
