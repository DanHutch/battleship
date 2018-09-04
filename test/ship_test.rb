## ship_3_test.rb

require './test/test_helper'
require './lib/ship'
require './lib/board'

class ShipTest < Minitest::Test

  def test_it_exists
    ship = Ship.new("npc", 2, ["A1", "A2", "A3"])
    assert_instance_of(Ship, ship)
  end

  def test_it_has_an_owner
    ship = Ship.new("npc", 2, ["A1", "A2", "A3"])
    assert_equal("npc", ship.owner)
  end

  def test_it_has_a_length
    ship = Ship.new("npc", 2, ["A1", "A2", "A3"])
    assert_equal(2, ship.length)
  end

  def test_it_has_spaces
    ship = Ship.new("npc", 2, ["A1", "A2", "A3"])
    assert_equal(["A1", "A2", "A3"], ship.spaces)
  end

  def test_it_starts_with_no_damage
    ship = Ship.new("npc", 2, ["A1", "A2", "A3"])
    assert_equal(0, ship.damage)
  end

  def test_it_can_occupy_those_spaces
    board = Board.new
    ship = Ship.new("npc", 2, ["A1", "A2", "A3"])
    ship.occupy
    assert_equal(true, board.npc_map["A1"].occupied)
    assert_equal(true, #space2.occupied)
    assert_equal(true, #space3.occupied)
  end

end
