# frozen_string_literal: true

class Genre
  attr_accessor :name, :items

  def initialize(id, name = '')
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.set_genre(self)
  end
end
