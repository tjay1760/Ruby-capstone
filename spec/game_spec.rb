require_relative '../game'

describe Game do
  game = Game.new('2029-10-01', true, '2030-11-11')
  context 'When creating a game' do
    it 'Should have the right properties' do
      expect(game.multiplayer).to eq(true)
      expect(game.last_played_at).to eq('2030-11-11')
      expect(game.publish_date).to eq('2029-10-01')
    end
  end
end
