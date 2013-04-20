module Sudoku
  class Board
    BOARD_SIZE = 9
    POSSIBLE_VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9]

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

    def set_block(index, values)
      start = Board.start_coordinates_for_block(index)
      (0..2).each do |col|
        (0..2).each do |row|
          values_index = col*3 + row
          self[col + start[0], row + start[1]] = values[values_index]
        end
      end
    end

    def block(index)
      start = Board.start_coordinates_for_block(index)
      (0..2).collect do |col|
        (0..2).collect do |row|
          value_at(col + start[0], row + start[1])
        end
      end.flatten(1)
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

    def fill_possibilities
      rows.each do |row|
        (0..8).each do |index|
          row[index] = POSSIBLE_VALUES.clone unless row[index]
        end
      end
    end

    def remove_from_set(set, values_for_removal)
      set.collect do |cell|
        if cell.kind_of?(Array)
          cell = cell - values_for_removal
          cell = cell.first if cell.size == 1
        end
        cell
      end
    end

    def remove_by_row
      changed = false
      rows.each_with_index do |row, i|
        known_values = row.select{|cell| !cell.kind_of?(Array) }
        result = remove_from_set(row, known_values)
        unless row == result
          set_row(i, result)
          changed = true
        end
      end
      return changed
    end

    def remove_by_column
      changed = false
      columns.each_with_index do |column, i|
        known_values = column.select{|cell| !cell.kind_of?(Array) }
        result = remove_from_set(column, known_values)
        unless column == result
          set_column(i, result)
          changed = true
        end
      end
      return changed
    end

    def remove_by_block
      changed = false
      blocks.each_with_index do |block, i|
        known_values = block.select{|cell| !cell.kind_of?(Array) }
        result = remove_from_set(block, known_values)
        
        unless block == result

          set_block(i, result)
          changed = true
        end
      end
      return changed
    end 

    def solved?
      rows.all? do |row|
        row.all?{|cell| cell.kind_of?(Fixnum)}
      end
    end
    
  end
end
