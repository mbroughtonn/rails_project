require "csv"

Game.delete_all
Genre.delete_all
Publisher.delete_all

filename = Rails.root.join("db/video_games.csv")

puts "Loading data from this file: #{filename}"