require 'date'
require_relative 'item'
class Game < Item
  attr_accessor :last_played_at, :multiplayer, :publish_date

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && last_played_at < Date.today.prev_year(2)
  end
end

class GameAdder
  def add_game(games, authors)
    puts 'Adding a Game'
    puts "Published on Which date (format YYYY-MM-DD) \n"
    date = gets.chomp
    puts "Is it multiplayer? (y/n) \n"
    multiplayer = gets.chomp
    puts "Was last playet on which date? (format YYYY-MM-DD) \n"
    last_played = gets.chomp
    game_update(date, multiplayer, last_played, games, authors)
  end

  def game_update(date, multiplayer, last_played, games, authors)
    puts 'Add details about the creator'
    puts 'First Name: '
    first_name = gets.chomp
    puts 'Last name: '
    last_name = gets.chomp
    game = Game.new(date, multiplayer == 'y', last_played)
    author = Author.new(first_name, last_name)
    author.add_item(game)
    games.push(game)
    authors.push(author)
  end
end
