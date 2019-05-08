require './lib/board.rb' 

describe Board do 
   context "#initialize" do 
      
      it 'board initializes without error' do
        expect{ Board.new }.to_not raise_error
      end

      it 'initializes with default grid' do
        board=Board.new
        default_grid=[
          '',
          "   1 | 2 | 3 ",
          '  ———|———|———',
          "   4 | 5 | 6 ",
          '  ———|———|———',
          "   7 | 8 | 9 ",
          ''
        ].join("\n")
			  expect(board.get_grid).to eq(default_grid)
      end
      
    end
    
    context "#update" do 
      it 'updates grid cell' do
        board=Board.new
        board.update(5,'X')
        modified_grid=[
          '',
          "   1 | 2 | 3 ",
          '  ———|———|———',
          "   4 | X | 6 ",
          '  ———|———|———',
          "   7 | 8 | 9 ",
          ''
        ].join("\n")
        expect( board.get_grid ).to eq(modified_grid)
      end
    end
end