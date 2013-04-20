module Sudoku
  class Printer
    def self.print(board)
      puts "Results:"
      if board        
        puts board.rows.collect{ |row| row.join}.join("\n")
      else
        puts "Board cannot be solved"
      end
    end
  end
end