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

    def []=(x, y, value)
      @rows[y][x] = value
    end
  end
end
