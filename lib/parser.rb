require './lib/board'

module Sudoku
  class Parser
    def self.parse(path)
      board = Sudoku::Board.new
      input_file = File.open(path, 'r')
      input_file.each_with_index do |row, y|
        values = row.chomp.split("").collect{|cell| cell.to_i}
        board.set_row(y, values)
      end

      return board
    end
  end
end