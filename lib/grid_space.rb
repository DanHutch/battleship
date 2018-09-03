## grid_space.rb

require 'pry'

class GridSpace
  attr_reader   :row,
                :column,
                :name,
                :visual

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
    @visual = " "
  end

  def player_occupy(spaces) #spaces - array or single?
    @occupied = true
    @visual = "O"
  end

  def npc_occupy(spaces) #spaces - array or single?
    @occupied = true
  end

  def guess
    if @hitted || @missed
      "Already guessed; please guess again."
    elsif @occupied
      @visual = "H"
      @hitted = true
      "Hit!"
    else
      @visual = "M"
      @missed = true
      "Miss!"
    end
  end

end
