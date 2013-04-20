require './lib/solver'

describe Sudoku::Solver do 
  describe '.solve_row' do
    it "determines the last value of a row" do
      output = Sudoku::Solver.solve_row( [nil, 2, 3, 4, 5, 6, 7, 8, 9] )
      expect(output).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    it "does not solve a row with more than one missing element" do
      input = [1, 2, 3, 4, 5, 6, 7, nil, nil]
      output = Sudoku::Solver.solve_row( input )
      expect(output).to_not be
    end

    it "determines the last value of a row in an unknown position" do
      expected = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffle
      input = expected.clone
      input[rand(9)] = nil
      output = Sudoku::Solver.solve_row( input )
      expect(output).to eq expected
    end

    it "solves an already solved row" do
      expected = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffle
      input = expected.clone
      output = Sudoku::Solver.solve_row( input )
      expect(output).to eq expected
    end
  end

  describe '.solve' do
    it "doesn't wipe out an unsolvable column" do
      board = Sudoku::Board.new
      output = Sudoku::Solver.solve(board)
      expect(output.column(0)).to be
    end
  end
end