class App
    def initialize
      @books = []
      @music_albums = []
      @games = []
  
      @choice_list = {
        '1' => 'Create an Item',
        '2' => 'List all items.',
        '3' => 'List all genres.',
        '4' => 'List all labels.',
        '5' => 'List all authors.',
        '6' => 'Exit'
      }
    end
  
    def start_app
      loop do
        puts 'Welcome to the catalogue of your things'
        @choice_list.each do |key, value|
          puts "#{key} - #{value}"
        end
        option = gets.chomp
        break if choose_option(option) == false
      end
    end
  
    def exit_app
      puts 'Thank you for using this app'
    end
  
    def choose_option(option)
      case option
      when '1'
        create_item
      when '2'
        list_items
      when '3'
        list_genres
      when '4'
        list_label
      when '6'
        exit_app
        return false
      else
        puts 'Invalid option'
      end
      true
    end
  
    def create_item
      puts 'Create Item'
    end
  
    def list_items
      puts 'Item List'
    end
  
    def list_genres
      puts 'Listing Genres'
    end
  
    def list_label
      puts 'Listing Label'
    end
  end
  
  