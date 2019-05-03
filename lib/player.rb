class Player
  attr_accessor :name, :sign
  attr_reader :positions
  def initialize
    @positions = []
  end

  def player_info
    "#{@name}: #{@sign}\n"
  end

  def add_position(pos)
    @positions << pos
  end
end
