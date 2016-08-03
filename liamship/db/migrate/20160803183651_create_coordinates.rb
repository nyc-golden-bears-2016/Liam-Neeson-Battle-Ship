class CreateCoordinates < ActiveRecord::Migration[5.0]
  def change
    create_table :coordinates do |t|
      t.string :row, null: false
      t.string :column, null: false

      t.timestamps null: false
    end
  end
end
