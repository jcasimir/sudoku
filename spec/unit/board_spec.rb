require './lib/board'

describe Sudoku::Board do
  describe '#value_at' do
    it "returns the value of a cell" do
      board = Sudoku::Board.new
      board[0,0] = 6
      expect(board.value_at(0,0)).to eq 6
    end

    it "returns the value of a cell with non-equal x and y" do
      board = Sudoku::Board.new
      board[2,3] = 6
      expect(board.value_at(2,3)).to eq 6
    end

  end

  describe "#row" do
    it "returns the first row of data when given 0" do
      board = Sudoku::Board.new
      values = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      board.set_row(0, values)
      expect(board.row(0)).to eq values
    end
  end

  describe "#column" do
    it "returns the specified column of the board" do
      board = Sudoku::Board.new
      target_column = rand(9)
      values = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffle
      board.set_column(target_column, values)
      expect(board.column(target_column)).to eq values
    end

    it "returns a column that has the data from the rows" do
      board = Sudoku::Board.new
      values = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffle
      board.set_row(0, values)
      expected = Array.new(9)
      expected[0] = values[0]
      expect(board.column(0)).to eq expected
    end
  end

  describe "#columns" do
    it "returns the columns" do
      board = Sudoku::Board.new
      values = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffle
      (0..8).each do |row_index|
        board.set_row(row_index, values)
      end
      expected = Array.new(9){ |i| Array.new(9){ values[i] }}
      
      expect(board.columns).to eq expected
    end
  end

  describe "#==" do
    it "checks equality by row between blank boards" do
      board1 = Sudoku::Board.new
      board2 = Sudoku::Board.new
      expect( board1 ).to eq board2
    end

    it "is false for different boards" do
      board1 = Sudoku::Board.new
      x = rand(8)
      y = rand(8)
      board1[x,y] = 1
      board2 = Sudoku::Board.new
      expect( board1 ).to_not eq board2
    end
  end

  describe '#block' do
    it "returns a block of a board" do
      board1 = Sudoku::Board.new
      (0..8).each do |row|
        (0..8).each do |column|
          board1[row, column] = row
        end
      end

      expect( board1.block(4) ).to eq [3, 3, 3, 4, 4, 4, 5, 5, 5]
    end
  end

  describe ".start_coordinates_for_block" do
    it "returns the coordinates for a given block index" do
      expect( Sudoku::Board.start_coordinates_for_block(4) ).to eq [3,3]
      expect( Sudoku::Board.start_coordinates_for_block(2) ).to eq [6,0]
    end
  end
end