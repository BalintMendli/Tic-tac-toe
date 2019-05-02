require_relative './player.rb'
require_relative './board.rb'
require_relative './ui.rb'
require 'set'

class Game
  include UI
  def initialize
    board = Board.new
    @players = []
    output('Welcome to Tic-tac-toe!', true)
    2.times { |n| get_player_data(n) }
    @current_player = @players[0]
    @other_player = @players[1]
    until full?
      clear_console
      output(players_info, true)
      board.draw
      abort("#{@players[won].name} won the game!") if won
      move = ask_move(@current_player)
      @current_player.add_position(move)
      board.update(@players[0].positions, @players[0].sign, @players[1].positions, @players[1].sign)
      switch_players
    end
    abort('The game ended with a draw!')
  end

  def get_player_data(n)
    output("Enter Player #{n + 1} name: ")
    name = input
    name = name.empty? ? "Player #{n + 1}" : name
    sign = n.even? ? 'X' : 'O'
    @players[n] = Player.new(name, sign)
  end

  def players_info
    "#{@players[0].name}: #{@players[0].sign}\n#{@players[1].name}: #{@players[1].sign}"
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

  def ask_move(player)
    output("#{player.name}'s move", true)
    output('Enter your next move (1-9): ')
    move = input.to_i
    until valid_move?(move)
      output('Invalid move. Try again: ')
      move = input.to_i
    end
    move
  end

  def valid_move?(move)
    move > 0 && move < 10 && !@current_player.positions.include?(move) && !@other_player.positions.include?(move)
  end

  def won
    winning_sets = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    winning_sets.each { |set| return 0 if set.to_set.subset?(@players[0].positions.to_set) }
    winning_sets.each { |set| return 1 if set.to_set.subset?(@players[1].positions.to_set) }
    nil
  end

  def full?
    (@players[0].positions + @players[1].positions).length
    (@players[0].positions + @players[1].positions).length == 9
  end
end

Game.new
