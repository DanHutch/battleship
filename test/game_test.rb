## game_test.rb

require './test_helper'
require './lib/game'
require './lib/ship'
require './lib/board'
require './lib/grid_space'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new
    assert_instance_of(Game, game)
  end

  def test_it_starts_with_all_npc_shots_available
    game = Game.new
    expected = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    assert_equal(expected, game.remaining_npc_shot_spaces)
    assert_equal(16, game.remaining_npc_shot_spaces.count)
  end

  def test_an_npc_shot_reduces_available_shots
    game = Game.new
    game.npc_shot
    assert_equal(15, game.remaining_npc_shot_spaces.count)
  end

  def test_it_can_create_ships
    game = Game.new
    game.initialize_ship("npc", ["A1", "A2", "A3"], "ship_3")
    assert_equal(1, game.npc_ships.count)
    assert_equal(Ship, game.npc_ships["ship_3"].class)
  end

  def test_it_can_occupy_spaces_with_ships
    game = Game.new
    game.initialize_ship("npc", ["A1", "A2", "A3"], "ship_3")
    game.place_ship(game.npc_ships["ship_3"])
    assert_equal(true, game.board.npc_map["A1"].occupied)
    assert_equal(" ", game.board.npc_map["A1"].visual)
    assert_equal(true, game.board.npc_map["A2"].occupied)
    assert_equal(" ", game.board.npc_map["A2"].visual)
    assert_equal(true, game.board.npc_map["A3"].occupied)
    assert_equal(" ", game.board.npc_map["A3"].visual)
    game.initialize_ship("player", ["A1", "A2", "A3"], "ship_3")
    game.place_ship(game.player_ships["ship_3"])
    assert_equal(true, game.board.player_map["A1"].occupied)
    assert_equal("O", game.board.player_map["A1"].visual)
    assert_equal(true, game.board.player_map["A2"].occupied)
    assert_equal("O", game.board.player_map["A2"].visual)
    assert_equal(true, game.board.player_map["A3"].occupied)
    assert_equal("O", game.board.player_map["A3"].visual)
  end

  def test_it_can_validate_spaces
    game = Game.new
    game.initialize_ship("player", ["A1", "A2", "A3"], "ship_3")
    expected = true
    actual = game.validate_spaces(game.player_ships["ship_3"])
    assert_equal(expected, actual)
  end

  def test_it_can_tell_invalid_spaces
    game = Game.new
    game.initialize_ship("player", ["A1", "A2", "A4"], "ship_3")
    expected = false
    actual = game.validate_spaces(game.player_ships["ship_3"])
    assert_equal(expected, actual)
  end

  def test_it_will_occupy_valid_spaces
    game = Game.new
    game.initialize_ship("player", ["A1", "A2", "A3"], "ship_3")
    game.place_ship(game.player_ships["ship_3"])
    assert_equal(true, game.board.player_map["A1"].occupied)
    assert_equal("O", game.board.player_map["A1"].visual)
    assert_equal(true, game.board.player_map["A2"].occupied)
    assert_equal("O", game.board.player_map["A2"].visual)
    assert_equal(true, game.board.player_map["A3"].occupied)
    assert_equal("O", game.board.player_map["A3"].visual)
  end

  def test__it_will_not_occupy_invalid_spaces
    game = Game.new
    game.initialize_ship("player", ["A1", "A2", "A4"], "ship_3")
    game.place_ship(game.player_ships["ship_3"])
    assert_equal(false, game.board.player_map["A1"].occupied)
    assert_equal(" ", game.board.player_map["A1"].visual)
    assert_equal(false, game.board.player_map["A2"].occupied)
    assert_equal(" ", game.board.player_map["A2"].visual)
    assert_equal(false, game.board.player_map["A3"].occupied)
    assert_equal(" ", game.board.player_map["A3"].visual)
    assert_equal(false, game.validate_spaces(game.player_ships["ship_3"]))
  end

  def test_it_will_validate_unoccupied_spaces
    game = Game.new
    game.initialize_ship("player", ["A1", "A2", "A3"], "ship_3")
    actual = game.check_unoccupied(game.player_ships["ship_3"])
    assert_equal(true, actual)
  end

  def test_it_will_invalidate_occupied_spaces_for_player
    game = Game.new
    game.initialize_ship("player", ["A1", "A2", "A3"], "ship_3")
    actual = game.check_unoccupied(game.player_ships["ship_3"])
    assert(actual)
    game.place_ship(game.player_ships["ship_3"])
    assert_equal(true, game.board.player_map["A1"].occupied)
    game.initialize_ship("player", ["A1", "B1"], "ship_2")
    actual = game.check_unoccupied(game.player_ships["ship_2"])
    refute(actual)
    game.place_ship(game.player_ships["ship_2"])
  end

  def test_it_will_invalidate_occupied_spaces_for_npc
    game = Game.new
    game.initialize_ship("npc", ["A1", "A2", "A3"], "ship_3")
    actual = game.check_unoccupied(game.npc_ships["ship_3"])
    assert(actual)
    game.place_ship(game.npc_ships["ship_3"])
    assert_equal(true, game.board.npc_map["A1"].occupied)
    game.initialize_ship("npc", ["A1", "B1"], "ship_2")
    actual = game.check_unoccupied(game.npc_ships["ship_2"])
    refute(actual)
    game.place_ship(game.npc_ships["ship_2"])
  end

  def test_npc_can_place_ships
    game = Game.new
    game.npc_place_ships
    actual =
    game.board.npc_map.find_all do |key, value|
      value.occupied == true
    end.count
    assert_equal(5, actual)
  end

  def test_a_player_shot_can_hit
    game = Game.new
    game.initialize_ship("npc", ["A1", "A2"], "ship_2")
    game.place_ship(game.npc_ships["ship_2"])
    expected = "Hit!"
    actual = game.player_shot("A2")
    assert_equal(expected, actual)
  end

  def test_player_hit_shows_on_board
    game = Game.new
    game.initialize_ship("npc", ["A1", "A2"], "ship_2")
    game.place_ship(game.npc_ships["ship_2"])
    game.player_shot("A2")
    expected = "H"
    actual = game.board.npc_map["A2"].visual
    assert_equal(expected, actual)
  end

  def test_a_player_shot_can_miss
    game = Game.new
    game.initialize_ship("npc", ["A1", "A2"], "ship_2")
    game.place_ship(game.npc_ships["ship_2"])
    expected = "Miss!"
    actual = game.player_shot("A3")
    assert_equal(expected, actual)
    assert_equal(0, game.npc_ships["ship_2"].damage)
  end

  def test_player_miss_shows_on_board
    game = Game.new
    game.initialize_ship("npc", ["A1", "A2"], "ship_2")
    game.place_ship(game.npc_ships["ship_2"])
    game.player_shot("A3")
    expected = "M"
    actual = game.board.npc_map["A3"].visual
    assert_equal(expected, actual)
  end

  def test_it_returns_warning_for_redundant_guess
    game = Game.new
    game.npc_place_ships
    game.player_shot("A3")
    expected = "Already guessed; please guess again."
    actual = game.player_shot("A3")
    assert_equal(expected, actual)
  end

  def test_hits_damage_ship
    game = Game.new
    game.initialize_ship("npc", ["A1", "A2"], "ship_2")
    game.place_ship(game.npc_ships["ship_2"])
    assert_equal(0, game.npc_ships["ship_2"].damage)
    game.player_shot("A2")
    assert_equal(1, game.npc_ships["ship_2"].damage)
    game.player_shot("A1")
    assert_equal(2, game.npc_ships["ship_2"].damage)
    assert(game.npc_ships["ship_2"].sunk?)
    assert_equal("2-Ship Sunk!", game.npc_ships["ship_2"].sunk?)

    game.initialize_ship("npc", ["B1", "B2", "B3"], "ship_3")
    game.place_ship(game.npc_ships["ship_3"])
    assert_equal(0, game.npc_ships["ship_3"].damage)
    game.player_shot("B2")
    assert_equal(1, game.npc_ships["ship_3"].damage)
    game.player_shot("B1")
    assert_equal(2, game.npc_ships["ship_3"].damage)
    game.player_shot("B3")
    assert_equal(3, game.npc_ships["ship_3"].damage)
    assert(game.npc_ships["ship_3"].sunk?)
    assert_equal("3-Ship Sunk!", game.npc_ships["ship_3"].sunk?)
  end

end
