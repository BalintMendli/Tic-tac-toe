require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

board = Board.new

player_1 = Player.new
player_2 = Player.new

game = Game.new(board, player_1, player_2)

game.play
