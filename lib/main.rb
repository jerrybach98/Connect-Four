require_relative 'board'
require_relative 'players'

class Game
  attr_accessor :player1, :player2, :board

  def initialize(board, players)
    @round = 0
    @board = board
    @players = players
  end

  # Keeping a clean public script method
  def play_game
    introduction
    @players.get_names
    @board.display_board
    puts game_loop
  end

  private

  def introduction
    puts 'Welcome to Connect Four!'
  end

  def game_loop
    loop do
      @round += 1
      return "It's a draw!" if draw?

      column = @players.get_input
      @board.drop_token(column, @round)
      @board.display_board
      return winner_announcement if @board.check_win?
    end
  end

  # No more tokens can be placed
  def draw?
    @round == 43
  end

  def winner_announcement
    if @board.check_win? && @round.odd?
      "#{@players.player1} wins!"
    elsif @board.check_win? && @round.even?
      "#{@players.player2} wins!"
    end
  end
end

board = Board.new
players = Players.new(board)
game = Game.new(board, players)
game.play_game