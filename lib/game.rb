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

  def npc_place_ships
    random = RandomSpaces.new
    #randomize placements for ship_2
    initialize_ship("npc", random_set_2, "ship_2")
    #place ship (with loop if placement is not valid)
    initialize_ship("npc", random_set_3, "ship_3")
    #place ship (with loop if placement is not valid)
  end

  def initialize_ship(owner, spaces, name)
    if owner == "npc"
      @npc_ships[name] = Ship.new(owner, spaces)
    elsif owner == "player"
      @player_ships[name] = Ship.new(owner, spaces)
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
