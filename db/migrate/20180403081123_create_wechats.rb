class CreateWechats < ActiveRecord::Migration[5.2]
  def change
    drop_table :weixins
    create_table :wechats do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
