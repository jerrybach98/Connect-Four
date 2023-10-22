class Board
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
    puts '0 1 2 3 4 5 6'
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
    @board.all? { |row| row[column] != '◯' }
  end

  private

  # Helper function to see how full a column is and return the row number that is empty
  def check_token_stack(row, column)
    row += 1 until @board[row][column] == '◯'
    row
  end

  # Uses a sliding window
  def row_win?
    @board.each do |row|
      col = 0

      until col == 4
        if row[col] != '◯' && row[col] == row[col + 1] && row[col] == row[col + 2] && row[col] == row[col + 3]
          return true
        end


        col += 1

      end
    end
    false
  end

  def column_win?
    transposed_board = @board.transpose
    transposed_board.each do |row|
      col = 0

      until col == 4
        if row[col] != '◯' && row[col] == row[col + 1] && row[col] == row[col + 2] && row[col] == row[col + 3]
          return true
        end


        col += 1

      end
    end
    false
  end

  def right_diagonal?
    (0..2).each do |row|
      (0..3).each do |col|
        if @board[row][col] != '◯' && 
           @board[row][col] == @board[row + 1][col + 1] && 
           @board[row][col] == @board[row + 2][col + 2] && 
           @board[row][col] == @board[row + 3][col + 3]
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
           @board[row][col] == @board[row - 1][col + 1] && 
           @board[row][col] == @board[row - 2][col + 2] && 
           @board[row][col] == @board[row - 3][col + 3]
          return true
        end
      end
    end
    false
  end
end