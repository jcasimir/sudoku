module Sudoku
	class Solver
    def self.possible_values
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def self.solve(board)
      board.fill_possibilities
      iterate(board)
    end

    def self.iterate(board)
      changed = false
      changed = board.remove_by_row | board.remove_by_column | board.remove_by_block
      iterate(board) if changed

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