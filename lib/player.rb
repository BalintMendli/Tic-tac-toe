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

  def add_position(pos)
    @positions << pos
  end
end
