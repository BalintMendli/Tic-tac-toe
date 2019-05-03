class Player
  attr_accessor :name, :sign, :positions
  def initialize
    @positions = []
  end

  def player_info
    "#{@name}: #{@sign}\n"
  end
end
