require './lib/player.rb'

describe Board do
  let(:player) { Player.new }

  context '#initialize' do
    it 'initializes with empty positions Array' do
      expect(player.positions).to eq([])
    end
  end

  context '#get_player_data' do
    it 'sets player name' do
      allow(player).to receive(:gets).and_return("test_player\n")
      player.get_player_data(0)
      expect(player.name).to eq('test_player')
    end
    it 'sets player sign' do
      allow(player).to receive(:gets).and_return("test_player\n")
      player.get_player_data(0)
      expect(player.sign).to eq('X')
    end
  end

  context '#player_info' do
    it 'returns player info' do
      allow(player).to receive(:gets).and_return("test_player\n")
      player.get_player_data(0)
      expect(player.player_info).to eq("test_player: X\n")
    end
  end

  context '#valid_move?' do
    it 'returns true if move is valid' do
      expect(player.valid_move?(5, [1, 3, 9, 8])).to eq(true)
    end
    it 'returns false if move is outside the range' do
      expect(player.valid_move?(10, [1, 3, 9, 8])).to eq(false)
    end
    it 'returns false if move is on a place already occupied by the player' do
      player.add_position(2)
      expect(player.valid_move?(2, [1, 3, 9, 8])).to eq(false)
    end
    it 'returns false if move is on a place occupied by the other player' do
      expect(player.valid_move?(3, [1, 3, 9, 8])).to eq(false)
    end
  end

  context '#ask_move' do
    it 'returns the move entered' do
      allow(player).to receive(:gets).and_return("4\n")
      expect(player.ask_move([1, 5])).to eq(4)
    end

    it 'asks the move again if entered invalid move' do
      allow(player).to receive(:gets).and_return("1\n", "4\n")
      expect { player.ask_move([1, 5]) }.to output(/Invalid move. Try again: /).to_stdout
    end
  end

  context '#add position' do
    it 'adds position to positions Array' do
      player.add_position(5)
      expect(player.positions).to eq([5])
    end
  end
end
