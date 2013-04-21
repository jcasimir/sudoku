require './lib/sudoku'

describe Sudoku::Solver do
	it "solves a complex puzzle" do
		starter = Sudoku::Parser.parse('./samples/problem_1')
		completed = Sudoku::Parser.parse('./samples/problem_1_solution')
		expect( starter.solve ).to eq(completed)
	end

	it "solves an already solved puzzle" do
		starter = Sudoku::Parser.parse('./samples/problem_1_solution')
		completed = Sudoku::Parser.parse('./samples/problem_1_solution')
		expect( starter.solve ).to(eq(completed))
	end

  it "solves a puzzle with only one missing cell per row" do
    starter = Sudoku::Parser.parse('./samples/problem_1_solution')
    starter.rows.each do |row|
      row[rand(9)] = nil
    end
    completed = Sudoku::Parser.parse('./samples/problem_1_solution')
    expect( starter.solve ).to(eq(completed))
  end

  it "solves a puzzle with only one missing cell per column" do
    starter = Sudoku::Parser.parse('./samples/problem_1_solution')
    starter.set_row(0, Array.new(9))
    completed = Sudoku::Parser.parse('./samples/problem_1_solution')
    expect( starter.solve ).to(eq(completed))
  end

  it "solves an element which can only be found by solving the block" do
    starter = Sudoku::Parser.parse('./samples/problem_1_solution')
    starter[0,0] = starter[3,0] = starter[0,3] = starter[3,3] = nil
    expect( starter.solve.value_at(0,0) ).to eq 4
  end

  it "solves a board with just one blank block" do
    starter = Sudoku::Parser.parse('./samples/problem_1_solution')
    (0..2).each do |column|
      (0..2).each do |row|
        starter[column, row] = nil
      end
    end
    expected = Sudoku::Parser.parse('./samples/problem_1_solution')
    expect( starter.solve ).to eq expected

  end

end