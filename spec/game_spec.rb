require '../game'

describe Game do
    game = Game.new
    context "When creating a game" do
        it "Should have the right properties" do
            expect(game.multiplayer).to eq()
            expect(game.last_played_at).to eq()
        end
    end
end