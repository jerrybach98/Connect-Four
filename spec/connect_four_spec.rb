require './lib/main.rb'


# test get_names to see if it's changing instance variables
describe Game do
  
  describe '#get_names' do
    context 'get names from both players' do
      subject(:game) { described_class.new(board, players) }
      let(:board) { instance_double(Board) }
      let(:players) { instance_double(Players) }

      it 'changes player 1 name' do
        allow(game).to receive(:gets).and_return('Jerry')
        expect { game.get_names }.to change { game.instance_variable_get(:@player1) }.to('Jerry')
      end

      it 'changes player 2 name' do
        allow(game).to receive(:gets).and_return('Mogu')
        expect { game.get_names }.to change { game.instance_variable_get(:@player2) }.to('Mogu')
      end
    end
  end

  describe '#play_game' do
    context 'get names from both players' do
      subject(:game) { described_class.new(board, players) }
      let(:board) { instance_double(Board) }
      let(:players) { instance_double(Players) }
      
      before do
      
      end

      it 'sends display board' do
        # expect(players).to receive(:gets).with('Jerry')
        allow(game).to receive(:gets).and_return('Jerry')
        expect { game.get_names }.to change { game.instance_variable_get(:@player1) }.to('Jerry')
      end

      it 'changes player 2 name' do
        allow(game).to receive(:gets).and_return('Mogu')
        expect { game.get_names }.to change { game.instance_variable_get(:@player2) }.to('Mogu')
      end
    end
  end

end




# Board 
# input
# win conditions