class Player
  attr_accessor :name, :sign, :positions
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
