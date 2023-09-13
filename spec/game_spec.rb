
require 'date'
require_relative '../game'

describe Game do
  game = Game.new(Date.parse('2029-10-01'), true, Date.parse('2030-11-11'))
  context 'When creating a game' do
    it 'Should have the right properties' do
      expect(game.multiplayer).to eq(true)
      expect(game.last_played_at).to eq(Date.parse('2030-11-11'))
      expect(game.publish_date).to eq(Date.parse('2029-10-01'))
    end
  end

  context 'When archiving' do
    it 'should be falsy' do
      expect(game.can_be_archived?).to eq(false)
    end
  end
end
