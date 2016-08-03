class CreateShips < ActiveRecord::Migration[5.0]
  def change
    create_table :ships do |t|
      t.string :type, null: false
      t.integer :lives, null: false

      t.timestamps null: false
    end
  end
end
