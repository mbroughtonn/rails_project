require "csv"

Game.delete_all
Genre.delete_all
Publisher.delete_all

filename = Rails.root.join("db/video_games.csv")
puts "Loading data from this file: #{filename}"

csv_data = File.read(filename)

games = CSV.parse(csv_data, headers: true, encoding: "utf-8")

games.each do |game|
    publisher = Publisher.create(name: game["Metadata.Publishers"])

    if !publisher&.valid?
        puts "This publisher has errors: #{game['Metadata.Publishers']}"
    end
end

puts "There are #{Publisher.count} publishers."
