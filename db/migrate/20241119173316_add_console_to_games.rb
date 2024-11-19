class AddConsoleToGames < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :console, :string
  end
end
