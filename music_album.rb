require_relative 'item'
class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end

class MusicAdder
  def add_music_album(music_albums, genres)
    puts 'Adding a Music Album'
    puts 'Enter the published date:'
    print '>> '
    date = gets.chomp
    puts 'Is it on Spotify? (y/n)'
    print '>> '
    on_spotify = gets.chomp
    puts 'What is the Genre of this music album?'
    name = gets.chomp
    album = MusicAlbum.new(date, on_spotify == 'y')
    genre = Genre.new(name)
    genre.add_item(album)
    music_albums.push(album)
    genres.push(genre)
    puts 'New music created'
  end
end
