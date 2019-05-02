class Player
  attr_reader :name, :sign, :positions
  def initialize(name, sign)
    @name = name
    @sign = sign
    @positions = []
  end

  def add_position(pos)
    @positions << pos
  end
end
