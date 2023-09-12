class Genre
  attr_accessor :name, :items

  def initialize(name = '')
    @id = Random.rand(10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.set_genre(self)
  end
end
