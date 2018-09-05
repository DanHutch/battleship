## game.rb

require './lib/board'
require './lib/ship'
require './lib/ship_validation'
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

  def npc_place_ships


  end

  def initialize_ship(owner, spaces, ship)
    if owner == "npc"
      @npc_ships[ship] = Ship.new(owner, spaces)
    elsif owner == "player"
      @player_ships[ship] = Ship.new(owner, spaces)
    end
  end

  def place_ship(ship)
    if validate_spaces(ship) && check_unoccupied(ship)
      ship.spaces.each do |space|
         @board.npc_map[space].npc_occupy if ship.owner == "npc"
         @board.player_map[space].player_occupy if ship.owner == "player"
      end
    else
      "Error: invalid or occupied ship placement"
    end
  end

  def validate_spaces(ship)
    validation = ShipValidation.new(ship.length)
    validation.valid_sets.include?(ship.spaces)
  end

  def check_unoccupied(ship)
    occupied_spaces = []
    if ship.owner == "player"
      ship.spaces.each do |space|
        if board.player_map[space].occupied
          occupied_spaces << board.player_map[space]
        end
      end
    elsif ship.owner == "npc"
      ship.spaces.each do |space|
        if board.npc_map[space].occupied
          occupied_spaces << board.npc_map[space]
        end
      end
    end
    occupied_spaces == []
  end

end
