## grid_space.rb

require 'pry'

class GridSpace
  attr_reader   :row,
                :column

  attr_accessor :occupied,
                :hitted,
                :missed,
                :guessed

  def initialize(row, column)
    @row = row
    @column = column
    @occupied = false
    @hit = false
    @missed = false
    @guessed = false
  end

end
