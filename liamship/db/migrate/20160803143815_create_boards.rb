class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.integer :host_id, foreign_key: true, null: false
      t.integer :opponent_id, foreign_key: true
      t.timestamps null: false
    end
  end
end
