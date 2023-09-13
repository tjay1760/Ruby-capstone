require_relative '../music_album'

describe MusicAlbum do
  context 'When creating new music' do
    music = MusicAlbum.new('2029-10-01', true)
    it 'Should have the right properties' do
      expect(music.publish_date).to eq('2029-10-01')
      expect(music.on_spotify).to eq(true)
    end
  end
end
