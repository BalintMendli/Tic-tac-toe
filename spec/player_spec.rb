require './lib/player.rb'

describe Player do
  let(:player) { Player.new }

  context '#initialize' do
    it 'initializes with empty positions Array' do
      expect(player.positions).to eq([])
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

  context '#add position' do
    it 'adds position to positions Array' do
      player.add_position(5)
      expect(player.positions).to eq([5])
    end
  end
end
