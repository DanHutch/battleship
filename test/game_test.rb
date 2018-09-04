## game_test.rb

require './test_helper'
require './lib/game'
require './lib/ship'
require './lib/board'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new
    assert_instance_of(Game, game)
  end

  def test_it_can_create_ships
    game = Game.new
    game.initialize_ship("npc", ["A1", "A2", "A3"], "ship_2")
    assert_equal(1, game.npc_ships.count)
    assert_equal(Ship, game.npc_ships["ship_2"].class)
  end

  def test_it_can_occupy_spaces_with_ships
    game = Game.new
    game.initialize_ship("npc", ["A1", "A2", "A3"], "ship_2")
    game.place_ship(game.npc_ships["ship_2"])
    assert_equal(true, game.board.npc_map["A1"].occupied)
    assert_equal(" ", game.board.npc_map["A1"].visual)
    assert_equal(true, game.board.npc_map["A2"].occupied)
    assert_equal(" ", game.board.npc_map["A2"].visual)
    assert_equal(true, game.board.npc_map["A3"].occupied)
    assert_equal(" ", game.board.npc_map["A3"].visual)
    game.initialize_ship("player", ["A1", "A2", "A3"], "ship_2")
    game.place_ship(game.player_ships["ship_2"])
    assert_equal(true, game.board.player_map["A1"].occupied)
    assert_equal("O", game.board.player_map["A1"].visual)
    assert_equal(true, game.board.player_map["A2"].occupied)
    assert_equal("O", game.board.player_map["A2"].visual)
    assert_equal(true, game.board.player_map["A3"].occupied)
    assert_equal("O", game.board.player_map["A3"].visual)
  end

  def test_it_can_validate_spaces
    game = Game.new
    game.initialize_ship("player", ["A1", "A2", "A3"], "ship_2")
    expected = true
    actual = game.validate_spaces(game.player_ships["ship_2"])
    assert_equal(expected, actual)
  end

  def test_it_can_tell_invalid_spaces
    game = Game.new
    game.initialize_ship("player", ["A1", "A2", "A4"], "ship_2")
    expected = false
    actual = game.validate_spaces(game.player_ships["ship_2"])
    assert_equal(expected, actual)
  end

end
