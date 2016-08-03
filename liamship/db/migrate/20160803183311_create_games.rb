class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :player_1_id, foreign_key: true, null: false
      t.integer :player_2_id, foreign_key: true
      t.integer :winner_id, foreign_key: true

      t.timestamps null: false
    end
  end
end
