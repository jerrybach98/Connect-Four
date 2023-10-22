require_relative 'board'

class Players
  attr_accessor :board, :player1, :player2

  def initialize(board)
    @player1 = nil
    @player2 = nil
    @board = board
  end

  def get_names
    puts 'Player 1 what is your name?'
    @player1 = gets.chomp
    puts 'Player 2 what is your name?'
    @player2 = gets.chomp
  end

  def get_input
    loop do
      input = gets.chomp
      input = Integer(input)
      return input if input.between?(0, 6) && @board.column_full?(input) == false

      puts 'Position invalid, please place your token between 0 and 6'
    rescue ArgumentError # Helps to handle invalid inputs if the string can't be converted to an integer
      puts 'Position invalid, please place your token between 0 and 6'
    end
    input
  end
end