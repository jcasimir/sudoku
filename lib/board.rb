module Sudoku
  class Board
    BOARD_SIZE = 9

    def initialize
      @rows = Array.new(BOARD_SIZE){ Array.new(BOARD_SIZE) }
    end

    def value_at(x, y)
      @rows[y][x]
    end

    def row(y)
      @rows[y]
    end

    def rows
      @rows
    end

    def set_row(y, values)
      @rows[y] = values
    end

    def column(x)
      @rows.collect do |row|
        row[x]
      end
    end

    def columns
      (0...BOARD_SIZE).collect{|i| column(i)}
    end

    def set_column(x, values)
      @rows.each_with_index do |row, i|
        row[x] = values[i]
      end
    end

    def block(index)
      # find first row and column based on index
      # get first three values of each row starting at column
      start = Board.start_coordinates_for_block(index)
      (0..2).collect do |col|
        (0..2).collect do |row|
          value_at(col + start[0], row + start[1])
        end
      end.flatten
    end

    def blocks
      (0..8).collect{|i| block(i)}
    end

    def self.start_coordinates_for_block(index)
      row = (index / 3)*3
      column = (index*3) % 9
      [column, row]
    end

    def []=(x, y, value)
      @rows[y][x] = value
    end

    def ==(other_board)
      self.rows == other_board.rows
    end

    
  end
end
