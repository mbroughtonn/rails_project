class DropGameStudiosTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :game_studios
  end
end
