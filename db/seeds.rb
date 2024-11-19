require "csv"

Game.delete_all
Genre.delete_all
Publisher.delete_all

filename = Rails.root.join("db/video_games.csv")
puts "Loading data from this file: #{filename}"

csv_data = File.read(filename)

games = CSV.parse(csv_data, headers: true, encoding: "utf-8")

games.each do |game|
    publisher = Publisher.find_or_create_by(name: game["Metadata.Publishers"])

    if publisher&.valid?
        # Create the game
        new_game = publisher.games.create(
            title: game["Title"],
            release_year: game["Release.Year"],
            rating: game["Release.Rating"],
            publisher: game["Metadata.Publishers"],
            genre: game["Metadata.Genres"],
            console: game["Release.Console"]
        )
        if !new_game&.valid?
            puts "Unable to create game: #{game["Title"]}"
        end
    else
        puts "This publisher has errors: #{game['Metadata.Publishers']}"
    end
end

puts "There are #{Publisher.count} publishers"
puts "There are #{Game.count} games"

