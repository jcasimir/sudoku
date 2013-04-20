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
end