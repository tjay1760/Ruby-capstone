require_relative 'item'
class MusicAlbum < Item
  def initialize(on_spotify: false)
    super()
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
