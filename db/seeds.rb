require "csv"

Game.delete_all
Genre.delete_all
Publisher.delete_all
Console.delete_all

filename = Rails.root.join("db/video_games.csv")
puts "Loading data from this file: #{filename}"

csv_data = File.read(filename)
games = CSV.parse(csv_data, headers: true, encoding: "utf-8")

games.each do |game|
  publisher = Publisher.find_or_create_by(name: game["Metadata.Publishers"])

  if publisher&.valid?
    genre_names = game["Metadata.Genres"].split(",")
    genres = genre_names.map { |name| Genre.find_or_create_by(name: name.strip) }

    console_name = game["Release.Console"]
    if console_name.blank?
      puts "Console name is blank for game: #{game['Title']}"
      console = Console.find_or_create_by(name: "Unknown Console")
    else
      console = Console.find_or_create_by(name: console_name.strip)
    end

    new_game = Game.new(
      title: game["Title"],
      release_year: game["Release.Year"],
      rating: game["Release.Rating"],
      publisher: publisher
    )

    new_game.genre = genres.first
    new_game.consoles << console

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
puts "There are #{Console.count} consoles"
puts "There are #{Game.count} games"
