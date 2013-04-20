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
      board
    end

    def self.solve_row(row)
      difference = possible_values - row
      
      if difference.size == 1 
        target = row.index(nil)
        row[target] = difference.first
        row
      elsif difference.size == 0
        row
      else
        false
      end
    end

    def self.solve_column(column)
      difference = possible_values - column
      
      if difference.size == 1 
        target = column.index(nil)
        column[target] = difference.first
        column
      elsif difference.size == 0
        column
      else
        false
      end
    end
  end
end