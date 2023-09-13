class App
  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @genres = []
    @authors = []

    @choice_list = {
      '1' => 'List all Books',
      '2' => 'List all Music Albums',
      '3' => 'List all Genres',
      '4' => 'List all Labels',
      '5' => 'List all Authors',
      '6' => 'List all Sources',
      '7' => 'Add a Book',
      '8' => 'Add a Music Album',
      '9' => 'Exit'
    }
  end

  ACTION_MAP = {
    '1' => :list_books,
    '2' => :list_music_albums,
    '3' => :list_genres,
    '4' => :list_labels,
    '5' => :list_authors,
    '6' => :list_sources,
    '7' => :add_book,
    '8' => :add_music_album,
    '9' => :exit_app
  }.freeze

  def start_app
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
    puts 'Listing Books'
  end

  def list_games
    puts 'Listing Games'
    if @games.empty?
      puts 'No Games to display'
    else
      @games.each do |game|
        puts "Published: #{game.publish_date}, #{game.multiplayer ? 'multiplayer' : 'single player'}"
        puts "Last played: #{game.last_played_at}"
      end
    end
  end

  def list_music_albums
    puts 'Listing Music Albums'
    if @music_albums.empty?
      puts 'No music Album to display'
    else
      @music_albums.each do |album|
        puts "Published at: #{album.publish_date}, #{album.on_spotify ? 'On Spotify' : 'Not on Spotify'}"
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
    puts 'Listing Labels'
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

  def list_sources
    puts 'Listing Sources'
  end

  def add_book
    puts 'Adding a Book'
  end

  def add_game
    puts 'Adding a Game'
    puts 'Published on Which date (format YYYY-MM-DD)'
    print '>> '
    date = gets.chomp
    puts 'Is it multiplayer? (Y/N)'
    print '>> '
    multiplayer = gets.chomp
    puts 'Was last playet on which date? (format YYYY-MM-DD)'
    print '>> '
    last_played = gets.chomp
    game = Game.new(date, multiplayer == 'Y', last_played)
    @games.push(game)
    puts 'New game created'
  end

  def add_music_album
    puts 'Adding a Music Album'
    puts 'Enter the published date:'
    print '>> '
    date = gets.chomp
    puts 'Is it on Spotify? (y/n)'
    print '>> '
    on_spotify = gets.chomp
    album = MusicAlbum.new(date, on_spotify == 'y')
    @music_albums.push(album)
    puts 'New music created'
  end
end

class Serializer
  def serialize_author; end

  def serialize_game; end

  def serialise_music(music)
    {
      publish_date: music.publish_date,
      on_spotify: music.on_spotify
    }
  end

  def serialize_genre(genre)
    {
      name: genre.name
    }
  end
end

class Saver
  def initialize
    @serializer = Serializer.new
  end

  def save_music(_genres)
    json_object = []
    musics.each do |music|
      json_object.push(@serializer.serialise_music(music))
    end
    File.write('music.json', json_object.to_json)
  end

  def save_genre(genres)
    json_object = []
    genres.each do |genre|
      json_object.push(@serializer.serialise_genre(genre))
    end
    File.write('genre.json', json_object.to_json)
  end
end
