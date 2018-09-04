## game.rb

require './lib/board'
require './lib/ship'
require 'pry'


class Game
  attr_reader :npc_ships,
              :player_ships,
              :board

  def initialize
    @board = Board.new
    @npc_ships = {}
    @player_ships = {}
  end

  # I need to set some validating methods somehow...
  # => owner must be (player / npc)
  # => length must be an integer and must be (2 / 3)
  # => spaces must be an array of strings
  # => => need to have validation conditions for the strings
  # => spaces.count must be equal to length

  def initialize_ship(owner, spaces, ship)
    if owner == "npc"
      @npc_ships[ship] = Ship.new(owner, spaces)
    elsif owner == "player"
      @player_ships[ship] = Ship.new(owner, spaces)
    end
  end

  def place_ship(ship)
    ship.spaces.each do |space|
       @board.npc_map[space].npc_occupy if ship.owner == "npc"
       @board.player_map[space].player_occupy if ship.owner == "player"
    end
  end

end
