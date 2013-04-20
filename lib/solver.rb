module Sudoku
	class Solver
    def self.possible_values
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def self.solve(board)
      board.fill_possibilities
      iterate(board)

      if board.solved?
        return board
      else
        false
      end
    end

    def self.iterate(board)
      changed = false
      changed = board.remove_by_row | board.remove_by_column | board.remove_by_block
      iterate(board) if changed

      board
    end
  end
end