## grid_space_test.rb

require './test/test_helper'
require './lib/grid_space'
require 'pry'

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
  end

  def test_it_begins_as_unhit
    space = GridSpace.new("a", 5)
    refute(space.hitted)
  end

  def test_it_begins_as_unmissed
    space = GridSpace.new("a", 5)
    refute(space.missed)
  end

  def test_it_begins_as_unguessed
    space = GridSpace.new("a", 5)
    refute(space.guessed)
  end

end
