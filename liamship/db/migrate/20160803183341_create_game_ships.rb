class CreateGameShips < ActiveRecord::Migration[5.0]
  def change
    create_table :game_ships do |t|
      t.integer :game_id, foreign_key: true, null: false
      t.integer :player_id, foreign_key: true, null: false
      t.integer :ship_id, foreign_key: true, null: false
      t.integer :current_lives, null: false

      t.timestamps null: false
    end
  end
end
