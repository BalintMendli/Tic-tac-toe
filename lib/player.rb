class Player
  attr_reader :name, :sign, :positions
  def initialize(name, sign)
    @name = name
    @sign = sign
    @positions = []
  end
end
