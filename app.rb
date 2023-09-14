require 'json'
require './author'
require './game'
require './genre'
require './item'
require './music_album'
require_relative 'src/create_book'
require_relative 'src/list_labels'
require_relative 'src/book_saver'
class App
  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @authors = []

    @choice_list = {
      '1' => 'List all Books',
      '2' => 'List all Music Albums',
      '3' => 'List all Genres',
      '4' => 'List all Labels',
      '5' => 'List all Authors',
      '6' => 'List all Games',
      '7' => 'Add a Book',
      '8' => 'Add a Game',
      '9' => 'Add a Music Album',
      '0' => 'Exit'
    }
  end

  ACTION_MAP = {
    '1' => :list_books,
    '2' => :list_music_albums,
    '3' => :list_genres,
    '4' => :list_labels,
    '5' => :list_authors,
    '6' => :list_games,
    '7' => :add_book,
    '8' => :add_game,
    '9' => :add_music_album,
    '0' => :exit_app
  }.freeze
  def load_files
    load_books = BookSaver.new(@Books)
    @books = load_books.parse_books
    loader = Loader.new
    loader.load_game(@games, @authors)
    loader.load_music(@music_albums, @genres)
  end

  def start_app
    load_files
    loop do
      puts 'Welcome to the catalog of your things'
      @choice_list.each do |key, value|
        puts "#{key} - #{value}"
      end
      option = gets.chomp
      break if choose_option(option) == false
    end
  end

  def exit_app
    saver = Saver.new
    savebook = BookSaver.new(@books)
    savebook.save_books
    saver.save_game(@games) if @games.length.positive?
    saver.save_music(@music_albums) if @music_albums.length.positive?
    puts 'Thank you for using this app'
    false
  end

  def choose_option(option)
    action = ACTION_MAP[option]
    if action
      send(action)
    else
      puts 'Invalid option'
    end
  end

  def list_books
    if @books.empty?
      puts 'No books Available'
    else
      @books.each_with_index do |book, index|
        puts "\n[#{index + 1}] The book: #{book.label.title} has been published in #{book.publish_date}"
      end
    end
  end

  def list_games
    puts 'Listing Games'
    if @games.empty?
      puts 'No Games to display'
    else
      @games.each do |game|
        puts "Published: #{game.publish_date}, #{game.multiplayer ? 'multiplayer' : 'single player'}"
        puts "Last played: #{game.last_played_at} \n\n"
      end
    end
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No music Album to display'
    else
      @music_albums.each do |album|
        puts "Published at: #{album.publish_date}, #{album.on_spotify ? 'On Spotify' : 'Not on Spotify'}"
        puts "genre: #{album.genre.name} \n\n"
      end
    end
  end

  def list_genres
    puts 'Listing Genres'

    if @genres.empty?
      puts 'No genres to display'
    else
      @genres.each do |genre|
        puts genre.name
      end
    end
  end

  def list_labels
    new_list = ListLabelHandler.new(@books, @music_albums, @games)
    new_list.handle
  end

  def list_authors
    puts 'Listing Authors'
    if @authors.empty?
      puts 'No author to display'
    else
      @authors.each do |author|
        puts "#{author.first_name} - #{author.last_name}"
      end
    end
  end

  def add_book
    input_data = InputData.new
    @books << input_data.add_book
  end

  def add_game
    adder = GameAdder.new
    adder.add_game(@games, @authors)
  end

  def add_music_album
    adder = MusicAdder.new
    adder.add_music_album(@music_albums, @genres)
  end
end

class Serializer
  def serialize_game(game)
    {
      publish_date: game.publish_date,
      multiplayer: game.multiplayer,
      last_played: game.last_played_at,
      author: {
        first_name: game.author.first_name,
        last_name: game.author.last_name
      }
    }
  end

  def serialize_music(music)
    {
      publish_date: music.publish_date,
      on_spotify: music.on_spotify,
      genre: {
        name: music.genre.name
      }
    }
  end
end

class Saver
  def initialize
    @serializer = Serializer.new
  end

  def save_music(musics)
    json_object = []
    musics.each do |music|
      json_object.push(@serializer.serialize_music(music))
    end
    File.write('music.json', json_object.to_json)
  end

  def save_game(games)
    json_object = []
    games.each do |game|
      json_object.push(@serializer.serialize_game(game))
    end
    File.write('game.json', json_object.to_json)
  end
end

class Loader
  def load_music(music_albums, genres)
    return unless File.exist?('music.json')

    json_music = File.empty?('music.json') ? [] : File.read('music.json')
    JSON.parse(json_music).map do |music|
      album = MusicAlbum.new(music['publish_date'], music['on_spotify'])
      genre = Genre.new(music['genre']['name'])
      genre.add_item(album)
      music_albums.push(album)
      genres.push(genre)
    end
  end

  def load_game(games, authors)
    return unless File.exist?('game.json')

    json_game = File.empty?('game.json') ? [] : File.read('game.json')
    JSON.parse(json_game).map do |game|
      new_game = Game.new(game['publish_date'], game['multiplayer'], game['last_played'])
      author = Author.new(game['author']['first_name'], game['author']['last_name'])
      author.add_item(new_game)
      games.push(new_game)
      authors.push(author)
    end
  end
end
