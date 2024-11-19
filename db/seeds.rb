require "csv"

# Clear existing data
Game.delete_all
Genre.delete_all
Publisher.delete_all

# Load CSV file
filename = Rails.root.join("db/video_games.csv")
puts "Loading data from this file: #{filename}"

csv_data = File.read(filename)
games = CSV.parse(csv_data, headers: true, encoding: "utf-8")

games.each do |game|
  # Find or create publisher
  publisher = Publisher.find_or_create_by(name: game["Metadata.Publishers"])

  if publisher&.valid?
    # Find or create genre (if there are multiple genres, handle them)
    genre_names = game["Metadata.Genres"].split(",") # Assumes genres are comma-separated
    genres = genre_names.map { |name| Genre.find_or_create_by(name: name.strip) }

    # Create the game
    new_game = Game.new(
      title: game["Title"],
      release_year: game["Release.Year"],
      rating: game["Release.Rating"],
      console: game["Release.Console"],
      publisher: publisher # Correct association
    )

    # Assign the first genre (or handle multiple genres if required)
    new_game.genre = genres.first

    if new_game.save
      puts "Created game: #{new_game.title}"
    else
      puts "Unable to create game: #{game["Title"]}"
      puts new_game.errors.full_messages
    end
  else
    puts "This publisher has errors: #{game['Metadata.Publishers']}"
  end
end

puts "There are #{Publisher.count} publishers"
puts "There are #{Genre.count} genres"
puts "There are #{Game.count} games"
