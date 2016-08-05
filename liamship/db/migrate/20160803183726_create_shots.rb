class CreateShots < ActiveRecord::Migration[5.0]
  def change
    create_table :shots do |t|
      t.integer :game_id, foreign_key: true, null: false
      t.integer :coordinate_id, foreign_key: true, null: false
      t.boolean :hit
      t.integer :player_id, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
