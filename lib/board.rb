require './lib/solver'

module Sudoku
  class Board
    attr_reader :rows
    
    BOARD_SIZE = 9

    include Solver

    def initialize
      @rows = Array.new(BOARD_SIZE){ Array.new(BOARD_SIZE) }
    end

    def []=(x, y, value)
      rows[y][x] = value
    end

    def ==(other)
      self.rows == other.rows
    end

    def value_at(x, y)
      rows[y][x]
    end

    def row(y)
      rows[y]
    end

    def set_row(y, values)
      rows[y] = values
    end

    def column(x)
      rows.collect{|row| row[x]}
    end

    def columns
      (0...BOARD_SIZE).collect{|i| column(i)}
    end

    def set_column(x, values)
      rows.each_with_index do |row, i|
        row[x] = values[i]
      end
    end

    def set_block(index, values)
      start = start_coordinates_for_block(index)
      (0..2).each do |col|
        (0..2).each do |row|
          values_index = col*3 + row
          self[col + start[0], row + start[1]] = values[values_index]
        end
      end
    end

    def block(index)
      start = start_coordinates_for_block(index)
      (0..2).collect do |col|
        (0..2).collect do |row|
          value_at(col + start[0], row + start[1])
        end
      end.flatten(1)
    end

    def blocks
      (0..8).collect{|i| block(i)}
    end

    def start_coordinates_for_block(index)
      row = (index / 3)*3
      column = (index*3) % 9
      [column, row]
    end
  end
end
