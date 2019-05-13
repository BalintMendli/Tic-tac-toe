require './lib/game.rb'
require './lib/player.rb'
require './lib/board.rb'

describe Game do
  let(:player_1) { Player.new }
  let(:player_2) { Player.new }
  let(:board) { Board.new }
  let(:game) { Game.new(board, player_1, player_2) }

  context '#initialize' do
    it 'game initializes without error' do
      expect { game }.to_not raise_error
    end
  end

  context '#won_by' do
    it 'returns 0 when player_1 wins with vertical positions' do
      player_1.add_position(1)
      player_1.add_position(4)
      player_1.add_position(7)
      expect(game.won_by).to eq(0)
    end

    it 'returns 1 when player_2 wins with horizontal positions' do
      player_2.add_position(1)
      player_2.add_position(2)
      player_2.add_position(3)
      expect(game.won_by).to eq(1)
    end

    it 'returns 0 when player_1 wins with diagonal positions' do
      player_1.add_position(1)
      player_1.add_position(5)
      player_1.add_position(9)
      expect(game.won_by).to eq(0)
    end
  end

  context '#full?' do
    it 'return true if the board is full' do
      player_1.add_position(1)
      player_1.add_position(5)
      player_1.add_position(6)
      player_1.add_position(2)
      player_1.add_position(7)
      player_2.add_position(9)
      player_2.add_position(4)
      player_2.add_position(3)
      player_2.add_position(8)
      expect(game.full?).to eq(true)
    end
  end
end
