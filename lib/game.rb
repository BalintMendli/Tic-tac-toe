require_relative './player.rb'
require_relative './board.rb'
require_relative './ui.rb'

class Game
  include UI
  def initialize(board,players)
    @board = board
    @players = players
    output('Welcome to Tic-tac-toe!', true)
    2.times { |n| get_player_data(n) }
    @current_player = @players[0]
    @other_player = @players[1]
    while !won? || !full?
      clear_console
      output(@players[0].player_info)
      output(@players[1].player_info,true)
      grid=@board.get_grid
      output(grid,true)
      ask_move(@current_player)
      switch_players()
    end
  end

  def get_player_data(n)
    output("Enter Player #{n + 1} name: ")
    name = input
    name = name.empty? ? "Player #{n + 1}" : name
    @players[n].name = name
    sign = n.even? ? 'X' : 'O'
    @players[n].sign = sign
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

  def ask_move(player)
    output("#{player.name}'s move", true)
    output('Enter your next move (1-9): ')
    move = input
  end

  def won?; end

  def full?; end
end