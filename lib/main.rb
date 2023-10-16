# classes

class Game
  attr_accessor :player1, :player2, :board
  
  def initialize
    @round = 0
  end 

  # test this to see if it's changing instance variables
  def get_names
    puts 'Welcome to Connect Four!'
    puts 'Player 1 what is your name?'
    players = Players.new
    @player1 = gets.chomp
    puts 'Player 2 what is your name?'
    @player2 = gets.chomp
  end

  # Looping script method
  # check whether object is recieving calls to method with double instance
  def play_game
    get_names
    board = Board.new
    board.display_board

  end

  # announcements

  # Implement rounds for each input
    # Player 1 odd, player 2 even

end

class Board
  attr_accessor :player1, :player2


  def initialize
    @board = [
      ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
      ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
      ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
      ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
      ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
      ['◯', '◯', '◯', '◯', '◯', '◯', '◯']
    ]
  end
  
  def display_board
    reverse_board = @board.reverse
    reverse_board.each do |row|
      puts row.join(' ')
    end
    puts "0 1 2 3 4 5 6"
  end

  # update input
    # array position Board[6][input] or x- 1 until not empty
    # or try reversing the nested array

  # Win Conditions

    # Rows
      # Check for 4, each index == Y+1
      # 0-fourth column is last column to right

    # Columns
      # Check 4, == X+1
      # 

    # Diagonals
      # don't need to check full board
      # X and Y, -1 + 1
      # negative start from bottom

  # Draw

end

class Players

  def initialize
    @player1 = nil
    @player2 = nil
  end 


  # Player Name

  # take input 0-6

end

game = Game.new
game.play_game