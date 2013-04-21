require './lib/parser'
require './lib/solver'
require './lib/printer'

filename = ARGV[0]
board = Sudoku::Parser.parse(filename)
Sudoku::Printer.print_input(board)
Sudoku::Printer.print_solution(board.solve)
