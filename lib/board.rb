require_relative './cell.rb'
require_relative './ui.rb'

class Board
  include UI
  attr_accessor :values
  def initialize
    @values = Array.new(3) { |row| Array.new(3) { |col| Cell.new(row * 3 + col + 1) } }
  end

  def draw
    grid = [
      '',
      "   #{@values[0][0].value} | #{@values[0][1].value} | #{@values[0][2].value} ",
      '  ———|———|———',
      "   #{@values[1][0].value} | #{@values[1][1].value} | #{@values[1][2].value} ",
      '  ———|———|———',
      "   #{@values[2][0].value} | #{@values[2][1].value} | #{@values[2][2].value} ",
      ''
    ].join("\n")
    output(grid, true)
  end

  def update(player1_positions, player1_sign, player2_positions, player2_sign)
    player1_positions.each { |pos| @values[(pos - 1) / 3.floor][(pos - 1) % 3].value = player1_sign }
    player2_positions.each { |pos| @values[(pos - 1) / 3.floor][(pos - 1) % 3].value = player2_sign }
  end
end
