## ship_2.rb

require 'pry'
require './lib/board'


class Ship
  attr_reader :owner,
              :length,
              :spaces,
              :damage

  def initialize(owner, length, spaces)
    @owner = owner
    @length = length
    @spaces = spaces
    @damage = 0
  end

# I need to set some validating methods somehow...
# => owner must be (player / npc)
# => length must be an integer and must be (2 / 3)
# => spaces must be an array of strings
# => => need to have validation conditions for the strings
# => spaces.count must be equal to length

  def occupy
    binding.pry
    @spaces.each do |space|
      if @owner == "npc"
       Board.npc_map[space].npc_occupy
      elsif @owner == "player"
       Board.player_map[space].player_occupy
      end
    end
  end

end
