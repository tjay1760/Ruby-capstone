# frozen_string_literal: true

class App
  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []

    @choice_list = {
      '1' => 'List all Books',
      '2' => 'List all Music Albums',
      '3' => 'List all Movies',
      '4' => 'List all Games',
      '5' => 'List all Genres',
      '6' => 'List all Labels',
      '7' => 'List all Authors',
      '8' => 'List all Sources',
      '9' => 'Add a Book',
      '10' => 'Add a Music Album',
      '11' => 'Add a Movie',
      '12' => 'Add a Game',
      '13' => 'Exit'
    }
  end

  def start_app
    loop do
      puts 'Welcome to the catalog of your things'
      @choice_list.each do |key, value|
        puts "#{key} - #{value}"
      end
      option = gets.chomp
      if option == '13'
        puts 'Thank you for using this app'
        break
      end
      choose_option(option)
    end
  end

  def exit_app
    puts 'Thank you for using this app'
  end

  def choose_option(option)
    case option
    when '1'
      list_books
    when '2'
      list_music_albums
    when '3'
      list_movies
    when '4'
      list_games
    when '5'
      list_genres
    when '6'
      list_labels
    when '7'
      list_authors
    when '8'
      list_sources
    when '9'
      add_book
    when '10'
      add_music_album
    when '11'
      add_movie
    when '12'
      add_game
    when '13'
      exit_app
      false
    else
      puts 'Invalid option'
    end
  end

  def list_books
    puts 'Listing Books'
  end

  def list_music_albums
    puts 'Listing Music Albums'
  end

  def list_movies
    puts 'Listing Movies'
  end

  def list_games
    puts 'Listing Games'
  end

  def list_genres
    puts 'Listing Genres'
  end

  def list_labels
    puts 'Listing Labels'
  end

  def list_authors
    puts 'Listing Authors'
  end

  def list_sources
    puts 'Listing Sources'
  end

  def add_book
    puts 'Adding a Book'
  end

  def add_music_album
    puts 'Adding a Music Album'
  end

  def add_movie
    puts 'Adding a Movie'
  end

  def add_game
    puts 'Adding a Game'
  end
end
