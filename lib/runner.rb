require './lib/parser'
require './lib/solver'
require './lib/printer'

filename = ARGV[0]
problem = Sudoku::Parser.parse(filename)
#problem = Sudoku::Board.new
solved = Sudoku::Solver.solve(problem)
Sudoku::Printer.print(solved)
