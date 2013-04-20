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

    def []=(x, y, value)
      @rows[y][x] = value
    end

    def ==(other_board)
      self.rows == other_board.rows
    end

    def rows
      @rows
    end
  end
end
