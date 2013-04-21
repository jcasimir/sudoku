module Sudoku
	module Solver
    def fill_possibilities
      rows.each do |row|
        (0..8).each do |index|
          row[index] = possible_values.clone unless row[index]
        end
      end
    end

    def solve
      fill_possibilities
      iterate
      return self if solved?
    end

    def iterate
      iterate if [remove_by_row, remove_by_column, remove_by_block].any?
      return self
    end

    def solved?
      rows.all? do |row|
        row.all?{|cell| cell.kind_of?(Fixnum)}
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
  end
end