require './lib/main.rb'


# test get_names to see if it's changing instance variables
describe Game do
  
  describe '#play_game' do
    context 'see if methods are being sent to class' do
      subject(:game) { described_class.new(board, players) }
      let(:board) { instance_double(Board) }
      let(:players) { instance_double(Players) }

      before do
        allow(game).to receive(:puts)
        allow(board).to receive(:display_board)
        allow(players).to receive(:get_input)
        allow(players).to receive(:get_names)
        allow(board).to receive(:drop_token)
        allow(game).to receive(:game_loop).and_return("Win") #
      end

      it 'sends #get_names to player class' do
        expect(players).to receive(:get_names).once
        game.play_game
      end

      it 'sends #display_board to player class' do
        expect(board).to receive(:display_board).once
        game.play_game
      end

      xit 'receives win message' do
        expect(game.game_loop).to eq("Win")
      end
    end
  end

  describe '#game_loop' do
    subject(:game) { described_class.new(board, players) }
    let(:board) { instance_double(Board) }
    let(:players) { instance_double(Players) }
    
    context "play games looping script method" do
      before do 
        allow(board).to receive(:display_board)
        allow(players).to receive(:get_input)
        allow(game).to receive(:puts) # prevent puts information returned by function to display to console
        allow(board).to receive(:drop_token)
        allow(board).to receive(:check_win?).and_return(true)
      end

      it 'sends #display_board' do
        expect(board).to receive(:display_board).once
        game.game_loop
      end

      it 'sends #get_input to players class' do
        expect(players).to receive(:get_input).once
        game.game_loop
      end

      it 'sends #drop_token to board class' do
        expect(board).to receive(:drop_token).once
        game.game_loop
      end

      it 'increments round by 1' do
        expect { game.game_loop }.to change { game.instance_variable_get(:@round) }
      end
    end
  end
end


describe Board do
  
  describe '#drop_token' do
    subject(:token) { described_class.new }
    
    context 'get inputs from players between 0 and 6' do
      before do
      #  allow(input).to receive(:gets).and_return('5')
      # allow(token).to receive(:gets).and_return(3)
      end

      it 'adds token to change game board' do
        expect { token.drop_token(3, 1) }.to change { token.instance_variable_get(:@board) }
      end
    end
  end

  describe '#check_token_stack' do
    subject(:token) { described_class.new }
    
    context 'check how much a column is filled' do 
      it 'returns new value for row' do
        board = token.instance_variable_get(:@board)
        board[0][1] = "●"
        expect(token.check_token_stack(0, 1)).to eq(1)
      end
    end
  end

  describe '#column_full?' do
    subject(:token) { described_class.new }

    context 'check if column is filled entirely' do 
      it 'returns true when filled' do
        board = token.instance_variable_get(:@board)
        board.each do |row|
          row.map! do |element|
            element = '●'
          end
        end
        expect(token.column_full?(1)).to eq true
      end
    end
  end

  describe '#check_win?' do
    subject(:win) { described_class.new }

    context 'check for any patterns of four' do 
      before do
        allow(win).to receive(:row_win?).and_return(false)
        allow(win).to receive(:column_win?).and_return(true)
        # allow(win).to receive(:diagonal_win?).and_return(true)
      end

      it 'returns true when one win pattern matches' do
        expect(win.check_win?).to eq true
      end
    end
  end

  describe '#row_win?' do
    subject(:row) { described_class.new }

    context 'check for four in a row' do 
      before do
      end

      it 'returns true if four match on second row' do
        board = row.instance_variable_get(:@board)
        board[1][3], board[1][4], board[1][5], board[1][6] = '●', '●', '●', '●'
        expect(row.row_win?).to eq true
      end
    end
  end

  describe '#column_win?' do
    subject(:column) { described_class.new }

    context 'check for four in a column' do 
      before do
      end

      it 'returns true if four match in last column' do
        board = column.instance_variable_get(:@board)
        board[0][6], board[1][6], board[2][6], board[3][6] = '●', '●', '●', '●'
        expect(column.column_win?).to eq true
      end
    end
  end

  describe '#diagonal_win?' do
    subject(:row) { described_class.new }

    context 'check for four in a diagonal' do 
      before do
      end

      xit 'returns true if four match in diagonal' do
        expect(row.diagonal_win?).to eq true
      end
    end
  end



end

describe Players do

  describe '#get_names' do
    context 'get names from both players' do
      subject(:players) { described_class.new(board) }
      let(:board) { instance_double(Board) }
    
      before do
        allow(players).to receive(:puts)
        allow(players).to receive(:gets).and_return('Jerry', 'Mogu')
      end

      it 'changes player 1 name' do
        expect { players.get_names }.to change { players.instance_variable_get(:@player1) }.to('Jerry')
      end

      it 'changes player 2 name' do
        expect { players.get_names }.to change { players.instance_variable_get(:@player2) }.to('Mogu')
      end
    end
  end
  
  describe '#get_input' do
    subject(:input) { described_class.new(board) }
    let(:board) { instance_double(Board) }
    
    context 'get inputs from players between 0 and 6' do
      before do
        allow(input).to receive(:gets).and_return('5')
        allow(board).to receive(:column_full?).and_return(false)
      end

      it 'returns player input' do
        expect(input.get_input).to eq(5)
      end

      it 'sends #column_full? to board class' do
        expect(board).to receive(:column_full?)
        input.get_input
      end

    end

    context 'invalid input then valid input' do
      before do
        allow(input).to receive(:gets).and_return('a', '5')
        allow(board).to receive(:column_full?).and_return(false)
      end

      it 'displays error once then complete loop' do
        expect(input).to receive(:puts).with('Position invalid, please place your token between 0 and 6').once
        input.get_input
      end
    end
  end

end

@board = [
  ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
  ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
  ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
  ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
  ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
  ['◯', '◯', '◯', '◯', '◯', '◯', '◯']
]

# left diagonol
x ◯ ◯ x 0 0 0
x ◯ ◯ ◯ ◯ 0 0
x ◯ ◯ ◯ ◯ ◯ 0
0 ◯ ◯ ◯ ◯ ◯ ◯
0 0 ◯ ◯ ◯ ◯ ◯
0 0 0 x ◯ ◯ ◯

# right diagonal
0 0 0 ◯ ◯ ◯ ◯
0 0 ◯ ◯ ◯ ◯ ◯
0 ◯ ◯ ◯ ◯ ◯ ◯
◯ ◯ ◯ ◯ ◯ ◯ 0
◯ ◯ ◯ ◯ ◯ 0 0
◯ ◯ ◯ ◯ 0 0 0

0 1 2 3 4 5 6

