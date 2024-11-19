class CreateGamesConsolesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :games, :consoles do |t|
      t.index :game_id
      t.index :console_id
    end
  end
end
