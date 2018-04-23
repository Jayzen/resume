class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
      t.string :language
      t.string :time
      t.string :title
      t.text :description
      t.string :author_ranking
      t.string :paper_level
      t.integer :weight
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
