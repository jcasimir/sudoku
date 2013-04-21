require './lib/board'

module Sudoku
  class Parser
    def self.parse(path)
      Sudoku::Board.new.tap do |board|
        File.readlines(path).each_with_index do |row, y|
          board.set_row(y, parse_line(row))
        end
      end
    end

    def self.parse_line(line)
      line.chomp.split("").collect{|char| parse_character(char)}
    end

    def self.parse_character(input)
      input != "." ? input.to_i : nil
    end
  end
end