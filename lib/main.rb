# classes

class Game
  attr_accessor :player1, :player2, :board
  
  def initialize(board, players)
    @round = 0
    @board = board
    @players = players
  end 

  def introduction
    puts 'Welcome to Connect Four!'
  end

  # test this to see if it's changing instance variables
  def get_names
    introduction
    puts 'Player 1 what is your name?'
    @player1 = gets.chomp
    puts 'Player 2 what is your name?'
    @player2 = gets.chomp
  end

  # Looping script method
  # check whether object is recieving calls to method with double instance
  def play_game
    get_names
    loop do
      board.display_board
      column = @players.get_input
      board.drop_token(column)
    end

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

  def drop_token(y_value)
    @board[0][y_value] = "●"
    # loop do array position Board[0][input+!] until not ◯
    # change bottom array to a solid black circle
    # array filled helper function +!

  # "\e[31mtext here\e[0m"
  # if turn odd red
  # turn even yellow
  # yellow 33
  end

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


  def get_input
    loop do
      begin
        input = gets.chomp
        input = Integer(input)
        return input if input.between?(0, 6)
        
        puts 'Position invalid, please place your token between 0 and 6'
      rescue ArgumentError
        puts 'Position invalid, please place your token between 0 and 6'
      end
    end
    input
  end

end

players = Players.new
board = Board.new
game = Game.new(board, players)
game.play_game