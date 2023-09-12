# frozen_string_literal: true

require 'date'
require_relative 'item'
class Game < Item
  attr_accessor :last_played_at

  def initialize; end

  def can_be_archived?
    super && last_played_at < Date.today - 365 * 2
  end
end
