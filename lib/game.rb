## board_interactions.rb

require 'pry'

class Game

  def initialize
    @board = Board.new
    @npc_ships = []
    @player_ships = []
  end

  # I need to set some validating methods somehow...
  # => owner must be (player / npc)
  # => length must be an integer and must be (2 / 3)
  # => spaces must be an array of strings
  # => => need to have validation conditions for the strings
  # => spaces.count must be equal to length

  def ship_occupy(ship)
    ship.spaces.each do |space|
      if ship.owner == "npc"
       @board.npc_map[space].npc_occupy
     elsif ship.owner == "player"
       @board.player_map[space].player_occupy
      end
    end
  end

end
