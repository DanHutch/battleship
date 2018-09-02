## grid_space_test.rb

require './test/test_helper'
require './lib/grid_space'

class GridSpaceTest < Minitest::Test

  def test_it_exists
    space = GridSpace.new("a", 5)
    assert_instance_of(GridSpace, space)
  end

  def test_it_has_a_position
    space = GridSpace.new("a", 5)
    assert_equal("a", space.row)
    assert_equal(5, space.column)
  end

  def test_it_begins_as_unoccupied
    space = GridSpace.new("a", 5)
    refute(space.occupied)
    assert_equal(" ", space.visual)
  end

  def test_it_begins_as_unhit
    space = GridSpace.new("a", 5)
    refute(space.hitted)
  end

  def test_it_begins_as_unmissed
    space = GridSpace.new("a", 5)
    refute(space.missed)
  end

  def test_it_begins_with_blank_visual
    space = GridSpace.new("a", 5)
    assert_equal(" ", space.visual)
  end

  def test_it_can_be_occupied_by_player
    a1 = GridSpace.new("a", 1)
    a1.player_occupy
    assert_equal(true, a1.occupied)
    assert_equal("O", a1.visual)
  end

  def test_it_can_be_occupied_by_npc
    a1 = GridSpace.new("a", 1)
    a1.npc_occupy
    assert_equal(true, a1.occupied)
    assert_equal(" ", a1.visual)
  end

  def test_it_can_be_hit_by_player
    a1 = GridSpace.new("a", 1)
    a1.npc_occupy
    assert_equal("Hit!", a1.guess)
    assert(a1.hitted)
    refute(a1.missed)
    assert_equal("H", a1.visual)
  end

  def test_it_can_be_hit_by_npc
    a1 = GridSpace.new("a", 1)
    a1.player_occupy
    assert_equal("Hit!", a1.guess)
    assert(a1.hitted)
    refute(a1.missed)
    assert_equal("H", a1.visual)
  end

  def test_it_can_be_missed
    a1 = GridSpace.new("a", 1)
    assert_equal("Miss!", a1.guess)
    assert(a1.missed)
    refute(a1.hitted)
    assert_equal("M", a1.visual)
  end

  def test_a_space_cannot_be_guessed_twice
    a1 = GridSpace.new("a", 1)
    a1.guess
    expected = "Already guessed; please guess again."
    assert_equal(expected, a1.guess)
  end

end
