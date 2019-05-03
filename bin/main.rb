require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

board = Board.new

players = [Player.new, Player.new]

game = Game.new(board, players)

game.play
