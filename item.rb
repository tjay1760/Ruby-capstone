class Item
  attr_accessor :genre, :author, :label, :publish_date

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @genre = []
    @author = []
    @source = []
    @label = []
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  def move_to_archive
    return unless can_be_archived?

    true
  end

  def can_be_archived?
    Time.new.year - publish_date > 10
  end
end
