require 'date'
require_relative '../music_album'

describe MusicAlbum do
  music = MusicAlbum.new(Date.parse('1999-10-01'), true)

  context 'When creating new music' do
    it 'Should have the right properties' do
      expect(music.publish_date).to eq(Date.parse('1999-10-01'))
      expect(music.on_spotify).to eq(true)
    end
  end

  context 'When archiving music' do
    it 'Should be true if the date is more than 10 years' do
      expect(music.can_be_archived?).to eq(true)
    end
  end
end
