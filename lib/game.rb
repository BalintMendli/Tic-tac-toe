require_relative './ui.rb'
require 'set'

class Game
  include UI
  def initialize(board, player_1, player_2)
    @board = board
    @players = [player_1, player_2]
    @current_player = @players[0]
    @other_player = @players[1]
  end

  WINNING_SETS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze
  private_constant :WINNING_SETS

  def play
    intro
    loop do
      clear_console
      output(game_info, true)
      break if won_by && won_message(won_by)
      break if full? && draw_message

      move
      switch_players
    end
  end

  def won_by
    return 0 if WINNING_SETS.any? { |set|  set.to_set.subset?(@players[0].positions.to_set) }
    return 1 if WINNING_SETS.any? { |set|  set.to_set.subset?(@players[1].positions.to_set) }

    nil
  end

  def full?
    (@players[0].positions + @players[1].positions).length == 9
  end

  private

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

  def intro
    show_welcome_message
    2.times { |n| @players[n].get_player_data(n) }
  end

  def game_info
    @players[0].player_info + @players[1].player_info + @board.get_grid
  end

  def move
    move = @current_player.ask_move(@other_player.positions)
    @current_player.add_position(move)
    @board.update(move, @current_player.sign)
  end

  def won_message(won_by)
    output("#{@players[won_by].name} won the game!", true)
    true
  end

  def draw_message
    output('The game ended with a draw!', true)
    true
  end
end
