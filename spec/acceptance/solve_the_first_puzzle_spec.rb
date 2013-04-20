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
		pending
		starter = Sudoku::Parser.parse('./samples/problem_1_solution')
		completed = Sudoku::Parser.parse('./samples/problem_1_solution')
		solved = Sudoku::Solver.solve(starter)
		expect( solved ).to(eq(completed))
	end

end