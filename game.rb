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
