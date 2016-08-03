class CoordinateGameShips < ActiveRecord::Migration[5.0]
  def change
    create_table :coordinate_game_ships do |t|
      t.integer :coordinate_id, foreign_key: true, null: false
      t.integer :game_ship_id, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
