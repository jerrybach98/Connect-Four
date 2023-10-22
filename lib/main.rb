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
    if @round == 43
      true
    else
      false
    end
  end

  def winner_announcement
    if @board.check_win? && @round.odd?
      return "#{@players.player1} wins!"
    elsif @board.check_win? && @round.even?
      return "#{@players.player2} wins!"
    end
  end

end

class Board

  def initialize
    @board = [
      ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
      ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
      ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
      ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
      ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
      ['◯', '◯', '◯', '◯', '◯', '◯', '◯']]
  end
  
  def display_board
    reverse_board = @board.reverse
    reverse_board.each do |row|
      puts row.join(' ')
    end
    puts "0 1 2 3 4 5 6"
  end

  # Use round numbers to alternate token color
  def drop_token(column, round)
    row = 0
    row = check_token_stack(row, column)
    if round.odd?
      @board[row][column] = "\e[31m●\e[0m"
    else 
      @board[row][column] = "\e[1m\e[33m●\e[0m"
    end
  end

  # Checks for every win pattern
  def check_win?
    return true if row_win?
    return true if column_win?
    return true if right_diagonal?
    return true if left_diagonal?
    false
  end

  # Used in player class to determine if a column is already full when taking player input
  def column_full?(column)
    @board.all? { |row| row[column] != '◯'}
  end

  private

  # Helper function to see how full a column is and return the row number that is empty
  def check_token_stack(row, column)
    until @board[row][column] == '◯'
      row += 1
    end
    row
  end
  
  # Uses a sliding window
  def row_win?
    @board.each do |row|
      col = 0 

      until col == 4
        if row[col] != '◯' && row[col] == row[col+1] && row[col] == row[col+2] && row[col] == row[col+3]
          return true
        else 
          col += 1
        end
      end
    end
    false
  end

  def column_win?
    transposed_board = @board.transpose
    transposed_board.each do |row|
      col = 0 

      until col == 4
        if row[col] != '◯' && row[col] == row[col+1] && row[col] == row[col+2] && row[col] == row[col+3]
          return true
        else 
          col += 1
        end
      end
    end
    false
  end

  def right_diagonal?
    (0..2).each do |row|
      (0..3).each do |col|
        if @board[row][col] != '◯' && 
          @board[row][col] == @board[row+1][col+1] && 
          @board[row][col] == @board[row+2][col+2] && 
          @board[row][col] == @board[row+3][col+3]
          return true
        end
      end
    end
    false
  end

  def left_diagonal?
    (3..5).each do |row|
      (0..3).each do |col|
        if @board[row][col] != '◯' && 
          @board[row][col] == @board[row-1][col+1] && 
          @board[row][col] == @board[row-2][col+2] && 
          @board[row][col] == @board[row-3][col+3]
          return true
        end
      end
    end
    false
  end
end

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
      begin
        input = gets.chomp
        input = Integer(input)
        return input if input.between?(0, 6) && @board.column_full?(input) == false
        
        puts 'Position invalid, please place your token between 0 and 6'
      rescue ArgumentError # Helps to handle invalid inputs if the string can't be converted to an integer
        puts 'Position invalid, please place your token between 0 and 6'
      end
    end
    input
  end

end

board = Board.new
players = Players.new(board)
game = Game.new(board, players)
game.play_game

# review code / clean code / tests
# private methods
# apply style guide
# separate code
# run code