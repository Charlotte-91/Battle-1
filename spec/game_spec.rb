require 'game'

describe Game do

subject(:game) {described_class.new(player1, player2)}
subject(:finished_game) {described_class.new(dead_player, player2)}
let(:player1) {double :player, hit_points: 60 }
let(:player2) {double :player, hit_points: 60 }
let(:dead_player) {double :player, hit_points: 0 }


describe '#attack' do
      it 'damages the player' do
        expect(player2).to receive(:receive_damage)
        game.attack(player2)
      end
end

describe '#player_1' do
    it 'retrieves the first player' do
        expect(game.player1).to eq player1
    end
end
describe '#player_2' do
    it 'retrieves the second player' do
        expect(game.player2).to eq player2
    end
end

describe '#current_turn' do
    it 'starts as player 1' do
        expect(game.current_turn).to eq player1
    end
end

describe '#switch_turn' do
    it 'switches the turn' do
        game.switch_turns
        expect(game.current_turn).to eq player2
    end
end

describe '#opponent_of' do 
    it 'find the opponent of a player' do
        expect(game.opponent_of(player1)).to eq player2
        expect(game.opponent_of(player2)).to eq player1
    end
end

describe '#hp_check' do
  it 'checks the hp or each player' do
    expect(game.hp_check?).to eq false
  end
end

describe '#hp_check' do
  it 'checks the hp or each player' do
    expect(finished_game.hp_check?).to eq true
  end
end


end

