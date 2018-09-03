## ship_2.rb

require 'pry'


class Ship
  attr_reader :owner,
              :length,
              :spaces_occupying

  def initialize(owner, length, spaces)
    @owner = owner
    @length = length
    @spaces_occupying = spaces
  end

# I need to set some validating methods somehow...
# => owner must be (player / npc)
# => length must be an integer and must be (2 / 3)
# => spaces must be an array of strings
# => => need to have validation conditions for the strings
# => spaces.count must be equal to length

end
