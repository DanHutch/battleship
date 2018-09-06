## game.rb

require './lib/board'
require './lib/ship'
require './lib/ship_validation'
require './lib/random_spaces'
require 'pry'


class Game
  attr_reader :npc_ships,
              :player_ships,
              :board,
              :remaining_npc_shot_spaces

  def initialize
    @board = Board.new
    @npc_ships = {}
    @player_ships = {}
    @remaining_npc_shot_spaces = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  end

  def npc_place_ships
    random = RandomSpaces.new
    random.get_random_sets
    initialize_ship("npc", random.coordinates[0], "ship_2")
    initialize_ship("npc", random.coordinates[1], "ship_3")
    place_ship(@npc_ships["ship_2"])
    place_ship(@npc_ships["ship_3"])
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

  def player_shot(grid_space)
    player_hits_ship(grid_space)
    board.npc_map[grid_space].guess
  end

  def player_hits_ship(coordinate)
    @npc_ships.values.find do |ship|
      if ship.spaces.include?(coordinate)
          ship.hit
      end
    end
  end

  ## These methods have not yet been tested.
  ## I was trying to figure out how to test the npc_shots,
  ## given their random placement, when the deadline was imminent.

  def npc_shot
    grid_space = @remaining_npc_shot_spaces.shuffle!.pop
    npc_hits_ship(grid_space)
    board.player_map[grid_space].guess
  end

  def npc_hits_ship(coordinate)
    @player_ships.values.find do |ship|
      if ship.spaces.include?(coordinate)
          ship.hit
      end
    end
  end

end
