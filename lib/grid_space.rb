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
    @name = "#{row}#{column}"
    @occupied = false
    @hitted = false
    @missed = false
    @guessed = false
  end

  def occupy
    @occupied = true
  end

  def guess
    if @guessed
      # turn.tell_guessed_already
    elsif @occupied
      @hitted = true
      @guessed = true
      # turn.tell_hitted
    else
      @missed = true
      @guessed = true
      # turn.tell_missed
    end
  end

end
