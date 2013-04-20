require './lib/solver'
require './lib/parser'

describe Sudoku::Solver do
	it "solves a complex puzzle" do
		pending
		starter = Sudoku::Parser.parse('./samples/problem_1')
		completed = Sudoku::Parser.parse('./samples/problem_1_solution')
		solved = Sudoku::Solver.solve(starter)
		expect( solved ).to(eq(completed))
	end

	it "solves an already solved puzzle" do
		starter = Sudoku::Parser.parse('./samples/problem_1_solution')
		completed = Sudoku::Parser.parse('./samples/problem_1_solution')
		solved = Sudoku::Solver.solve(starter)
		expect( solved ).to(eq(completed))
	end

  it "solves a puzzle with only one missing cell per row" do
    starter = Sudoku::Parser.parse('./samples/problem_1_solution')
    starter.rows.each do |row|
      row[rand(9)] = nil
    end
    solved = Sudoku::Solver.solve(starter)
    completed = Sudoku::Parser.parse('./samples/problem_1_solution')
    expect( solved ).to(eq(completed))
  end

  it "solves a puzzle with only one missing cell per column" do
    starter = Sudoku::Parser.parse('./samples/problem_1_solution')
    starter.set_row(0, Array.new(9))
    solved = Sudoku::Solver.solve(starter)
    completed = Sudoku::Parser.parse('./samples/problem_1_solution')
    expect( solved ).to(eq(completed))
  end

end