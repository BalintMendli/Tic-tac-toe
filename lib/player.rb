require_relative './ui.rb'

class Player
  include UI
  attr_reader :name, :sign, :positions
  def initialize
    @positions = []
  end

  def get_player_data(n)
    output("Enter Player #{n + 1} name: ")
    name = input
    name = name.empty? ? "Player #{n + 1}" : name
    @name = name
    @sign = n.even? ? 'X' : 'O'
  end

  def player_info
    "#{@name}: #{@sign}\n"
  end

  def ask_move(other_player_positions)
    output("#{@name}'s move", true)
    output('Enter your next move (1-9): ')
    move = input.to_i
    until valid_move?(move, other_player_positions)
      output('Invalid move. Try again: ')
      move = input.to_i
    end
    move
  end

  def valid_move?(move, other_player_positions)
    move > 0 && move < 10 && !@positions.include?(move) && !other_player_positions.include?(move)
  end

  def add_position(pos)
    @positions << pos
  end
end
