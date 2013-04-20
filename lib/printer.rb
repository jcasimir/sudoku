module Sudoku
  class Printer
    def self.print(board)
      puts "Results:"
      if board        
        board.rows.each do |row|
          puts row.join
        end
      else
        puts "Board cannot be solved"
      end
    end
  end
end