require_relative './player.rb'
require_relative './board.rb'
require_relative './ui.rb'

class Game
  include UI
  def initialize
    board = Board.new
    @players = []
    output('Welcome to Tic-tac-toe!', true)
    2.times { |n| get_player_data(n) }
    @current_player = @players[0]
    @other_player = @players[1]
    while !won? || !full?
      clear_console
      output(players_info(),true)
      board.draw()
      move=ask_move(@current_player)
      @current_player.add_position(move)
      switch_players()
      gets
    end
  end

  def get_player_data(n)
    output("Enter Player #{n + 1} name: ")
    name = input
    name = name.empty? ? "Player #{n + 1}" : name
    sign = n.even? ? 'X' : 'O'
    @players[n] = Player.new(name, sign)
  end

  def players_info
    "#{@players[0].name}: #{@players[0].sign}\n#{@players[1].name}: #{@players[1].sign}"
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

  def ask_move(player)
    output("#{player.name}'s move", true)
    output('Enter your next move (1-9): ')
    move = input.to_i
    while !valid_move?(move)
      output('Invalid move. Try again: ')
      move = input.to_i
    end
    move
  end

  def valid_move?(move)
    move>0 && move<10 && !@current_player.positions.include?(move) && !@other_player.positions.include?(move)
  end

  def won?; end

  def full?; end
end

Game.new
