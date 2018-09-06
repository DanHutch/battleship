## ship_3_test.rb

require './test_helper'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_it_exists
    ship = Ship.new("npc", ["A1", "A2", "A3"])
    assert_instance_of(Ship, ship)
  end

  def test_it_has_an_owner
    ship = Ship.new("npc", ["A1", "A2", "A3"])
    assert_equal("npc", ship.owner)
  end

  def test_it_has_a_length
    ship = Ship.new("npc", ["A1", "A2", "A3"])
    assert_equal(3, ship.length)
  end

  def test_it_has_spaces
    ship = Ship.new("npc", ["A1", "A2", "A3"])
    assert_equal(["A1", "A2", "A3"], ship.spaces)
  end

  def test_it_starts_with_no_damage
    ship = Ship.new("npc", ["A1", "A2", "A3"])
    assert_equal(0, ship.damage)
  end

  def test_it_can_be_damaged
    ship = Ship.new("npc", ["A1", "A2", "A3"])
    assert_equal(0, ship.damage)
    ship.hit
    assert_equal(1, ship.damage)
    ship.hit
    assert_equal(2, ship.damage)
    ship.hit
    assert_equal(3, ship.damage)
  end

  def test_2_ship_can_be_sunk
    ship = Ship.new("npc", ["A1", "A2"])
    assert_equal(0, ship.damage)
    ship.hit
    ship.hit
    assert_equal(2, ship.damage)
    assert(ship.sunk?)
    assert_equal("2-Ship Sunk!", ship.sunk?)
  end

  def test_3_ship_can_be_sunk
    ship = Ship.new("npc", ["A1", "A2", "A3"])
    assert_equal(0, ship.damage)
    ship.hit
    ship.hit
    ship.hit
    assert(ship.sunk?)
    assert_equal("3-Ship Sunk!", ship.sunk?)
  end

end
