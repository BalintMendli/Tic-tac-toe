require './player.rb'

class Game
  
  def initialize
    @players = []
    puts 'Welcome to Tic-tac-toe'
    2.times { |n| get_player_data(n) }
    p @players
    @current_player=@players[0]
    @other_player=@players[1]
    while !won? || !full?
      ask_move(@current_player)
      switch_players()
    end
  end

  def get_player_data(n)
    print "Enter Player #{n + 1} name: "
    name = gets.chomp
    sign = n.even? ? 'X' : 'O'
    @players[n] = Player.new(name, sign)
  end

  def switch_players
    @current_player,@other_player=@other_player,@current_player
  end

  def ask_move(player)
    puts "#{player.name}'s move"
    print "Enter your next move (1-9): "
    move=gets.chomp
  end

  def won?
  end

  def full?
  end
end

Game.new
