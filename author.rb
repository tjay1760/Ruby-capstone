class Author
  attr_Accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @id = Random.rand(1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.set_author(self)
  end
end
