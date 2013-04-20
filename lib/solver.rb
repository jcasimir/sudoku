module Sudoku
	class Solver
    def self.possible_values
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def self.solve(board)
      
      board.rows.each_with_index do |row, i|
        solved_row = solve_row(board.row(i))        
        board.set_row(i, solved_row) if solved_row
      end
      board.columns.each_with_index do |column, i|
        solved_column = solve_column(board.column(i))        
        board.set_column(i, solved_column) if solved_column
      end
      board.blocks.each_with_index do |block, i|
        solved_block = solve_block(board.block(i))
        board.set_block(i, solved_block) if solved_block
      end

      board
    end

    def self.solve_row(row)
      solve_set(row)
    end

    def self.solve_column(column)
      solve_set(column)
    end

    def self.solve_block(block)
      solve_set(block)
    end

    def self.solve_set(input)
      difference = possible_values - input
      
      if difference.size == 1 
        target = input.index(nil)
        input[target] = difference.first
        input
      elsif difference.size == 0
        input
      else
        false
      end
    end
  end
end