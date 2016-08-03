class CreateShips < ActiveRecord::Migration[5.0]
  def change
    create_table :ships do |t|
      t.integer :user_id, foreign_key: true
      t.integer :board_id, foreign_key: true
      t.integer :lives, null: false
      t.timestamps null: false
    end
  end
end
