# frozen_string_literal: true

class Genre
  attr_accessor :name, :items

  def initialize(name = '')
    @id = Random.rand(10000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.set_genre(self)
  end
end
