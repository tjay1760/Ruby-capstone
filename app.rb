class App
  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []

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

      choose_option(option)
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

  def list_music_albums
    puts 'Listing Music Albums'
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
end
