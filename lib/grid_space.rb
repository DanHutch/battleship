## grid_space.rb

require 'pry'

class GridSpace
  attr_reader   :row,
                :column,
                :name

  attr_accessor :occupied,
                :hitted,
                :missed,
                :guessed

  def initialize(row, column)
    @row = row
    @column = column
    @occupied = false
    @hitted = false
    @missed = false
  end

  def occupy
    @occupied = true
  end

  def guess
    if @hitted || @missed
      "Already guessed; please guess again."
    elsif @occupied
      @hitted = true
      "Hit!"
    else
      @missed = true
      "Miss!"
    end
  end

end
