# classes

class Game
  attr_accessor :player1, :player2, :board
  
  def initialize(board, players)
    @round = 1
    @board = board
    @players = players
  end 

  def introduction
    puts 'Welcome to Connect Four!'
  end


  # script method
  def play_game
    introduction
    @players.get_names
    game_loop
  end

  # Looping script method
  def game_loop
    loop do
      board.display_board
      column = @players.get_input
      board.drop_token(column, @round)
      @round += 1
      return # for rspec until win condition is written
    end
  end

  # announcements

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

  def drop_token(column, round)
    row = 0
    row = check_token_stack(row, column)
    if round.odd?
      @board[row][column] = "\e[31m●\e[0m"
    else 
      @board[row][column] = "\e[1m\e[33m●\e[0m"
    end
  end

  def check_token_stack(row, column)
    until @board[row][column] == '◯'
      row += 1
    end
    row
  end

  def column_full?(column)
    @board.all? { |row| row[column] != '◯'}
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
  attr_accessor :board

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
      begin
        input = gets.chomp
        input = Integer(input)
        return input if input.between?(0, 6) && board.column_full?(input) == false
        
        puts 'Position invalid, please place your token between 0 and 6'
      rescue ArgumentError
        puts 'Position invalid, please place your token between 0 and 6'
      end
    end
    input
  end





end

# board = Board.new
# players = Players.new(board)
# game = Game.new(board, players)
# game.play_game