module Sudoku
  class Board
    attr_reader :rows
    
    include Solver

    def initialize
      @rows = Array.new(board_size){ Array.new(board_size) }
    end

    def board_size
      9
    end

    def possible_values
      (1..board_size).to_a
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
      (0...board_size).collect{|i| column(i)}
    end

    def set_column(x, values)
      rows.each_with_index do |row, i|
        row[x] = values[i]
      end
    end

    def set_block(index, values)
      start = origin_for_block(index)
      (0..2).each do |column|
        (0..2).each do |row|
          values_index = column * 3 + row
          self[column + start[0], row + start[1]] = values[values_index]
        end
      end
    end

    def block(index)
      start = origin_for_block(index)
      (0..2).collect do |column|
        (0..2).collect do |row|
          value_at(column + start[0], row + start[1])
        end
      end.flatten(1)
    end

    def blocks
      (0..8).collect{|i| block(i)}
    end

    def origin_for_block(index)
      column = (index * 3) % 9
      row = (index / 3)*3
      [column, row]
    end
  end
end
