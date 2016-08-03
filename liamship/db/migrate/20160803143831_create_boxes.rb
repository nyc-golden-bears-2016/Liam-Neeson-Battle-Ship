class CreateBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes do |t|
      t.integer :ship_id, foreign_key: true
      t.string :row, null: false
      t.integer :columm, null: false
      t.boolean :shot?, null: false, default: false
      t.timestamps null: false
    end
  end
end
