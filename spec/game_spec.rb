require './lib/game.rb'
require './lib/player.rb'
require './lib/board.rb'

describe Game do
  context '#initialize' do
    it 'game initializes without error' do
      expect { Game.new(Board.new, Player.new, Player.new) }.to_not raise_error
    end
  end

  context '#play' do
    it 'ends with player_1 win' do
      player_1 = Player.new
      player_2 = Player.new
      game = Game.new(Board.new, player_1, player_2)
      allow(player_1).to receive(:gets).and_return("test_player_1\n", "1\n", "4\n", "7\n")
      allow(player_2).to receive(:gets).and_return("test_player_2\n", "2\n", "5\n")
      expect { game.play }.to output(/test_player_1 won the game!/).to_stdout
    end

    it 'ends with player_2 win' do
      player_1 = Player.new
      player_2 = Player.new
      game = Game.new(Board.new, player_1, player_2)
      allow(player_1).to receive(:gets).and_return("test_player_1\n", "4\n", "7\n", "8\n")
      allow(player_2).to receive(:gets).and_return("test_player_2\n", "1\n", "2\n", "3\n")
      expect { game.play }.to output(/test_player_2 won the game!/).to_stdout
    end

    it 'ends with player_1 win' do
      player_1 = Player.new
      player_2 = Player.new
      game = Game.new(Board.new, player_1, player_2)
      allow(player_1).to receive(:gets).and_return("test_player_1\n", "1\n", "5\n", "9\n")
      allow(player_2).to receive(:gets).and_return("test_player_2\n", "4\n", "2\n")
      expect { game.play }.to output(/test_player_1 won the game!/).to_stdout
    end

    it 'ends with draw' do
      player_1 = Player.new
      player_2 = Player.new
      game = Game.new(Board.new, player_1, player_2)
      allow(player_1).to receive(:gets).and_return("test_player_1\n", "1\n", "5\n", "6\n", "2\n", "7\n")
      allow(player_2).to receive(:gets).and_return("test_player_2\n", "9\n", "4\n", "3\n", "1\n", "8\n")
      expect { game.play }.to output(/The game ended with a draw!/).to_stdout
    end
  end
end
