## ship_2.rb

require 'pry'


class Ship
  attr_reader :owner,
              :length,
              :spaces

  def initialize(owner, length, spaces)
    @owner = owner
    @length = length
    @spaces = spaces
  end

# I need to set some validating methods somehow...
# => owner must be (player / npc)
# => length must be an integer and must be (2 / 3)
# => spaces must be an array of strings
# => => need to have validation conditions for the strings
# => spaces.count must be equal to length

  def occupy
    @spaces_occupying.each do |space|
       #here i need to figure out how to call the occupy methods in the GridSpace class! (or use a method that changes the values of grid_space.occupied (and sometimes grid_space.visual) through an attr_accessor)
       grid_space =
       board.grid_space[]
    end
  end

end
