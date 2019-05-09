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

  context '#play' do
    it 'ends with player_1 win with vertical positions' do
      allow(player_1).to receive(:gets).and_return("test_player_1\n", "1\n", "4\n", "7\n")
      allow(player_2).to receive(:gets).and_return("test_player_2\n", "2\n", "5\n")
      expect { game.play }.to output(/test_player_1 won the game!/).to_stdout
    end

    it 'ends with player_2 win horizontal positions' do
      allow(player_1).to receive(:gets).and_return("test_player_1\n", "4\n", "7\n", "8\n")
      allow(player_2).to receive(:gets).and_return("test_player_2\n", "1\n", "2\n", "3\n")
      expect { game.play }.to output(/test_player_2 won the game!/).to_stdout
    end

    it 'ends with player_1 win with diagonal positions' do
      allow(player_1).to receive(:gets).and_return("test_player_1\n", "1\n", "5\n", "9\n")
      allow(player_2).to receive(:gets).and_return("test_player_2\n", "4\n", "2\n")
      expect { game.play }.to output(/test_player_1 won the game!/).to_stdout
    end

    it 'ends with draw when board is full and nobody won' do
      allow(player_1).to receive(:gets).and_return("test_player_1\n", "1\n", "5\n", "6\n", "2\n", "7\n")
      allow(player_2).to receive(:gets).and_return("test_player_2\n", "9\n", "4\n", "3\n", "1\n", "8\n")
      expect { game.play }.to output(/The game ended with a draw!/).to_stdout
    end
  end
end
