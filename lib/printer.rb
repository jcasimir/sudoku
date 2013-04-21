module Sudoku
  class Printer
    def self.print_input(input)
      puts "==== Input ==="
      print(input)
    end

    def self.print_solution(solution)
      puts "== Solution =="
      print(solution)
    end

    def self.print(board)
      if board        
        board.rows.each_with_index do |row, y| 
          puts format_row(row, y)
          puts "" if insert_spacer?(y)
        end
      else
        puts "Board cannot be solved"
      end
    end

    def self.format_row(row, y)
      results = [" "]
      row.each_with_index do |value, x|
        results << (value ? value : '.')
        results << "  " if insert_spacer?(x)
      end
      results.join
    end

    def self.insert_spacer?(index)
      index % 3 == 2
    end
  end
end