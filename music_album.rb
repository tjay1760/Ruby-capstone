require_relative 'item'
class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date

  def initialize(publish_date, on_spotify)
    super(genre, author, source, label, publish_date, archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
