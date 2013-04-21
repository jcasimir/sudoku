require './lib/sudoku'

describe Sudoku::Parser do
  describe '.parse' do
    it "parses a sample file" do
      result = Sudoku::Parser.parse('./samples/problem_1_solution')
      expect(result.value_at(0, 0)).to eq 4
    end

    it "parses a sample file" do
      result = Sudoku::Parser.parse('./samples/problem_1_solution')
      expect(result.value_at(8, 0)).to eq 1
    end

    it "finds the row of a sample file" do
      result = Sudoku::Parser.parse('./samples/problem_1_solution')
      expect(result.row(0)).to eq [4, 6, 7, 2, 3, 8, 9, 5, 1]
    end
  end
end