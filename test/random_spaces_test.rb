## random_spaces_test.rb

require './test_helper'
require './lib/random_spaces'

class GridSpaceTest < Minitest::Test

  def test_it_exists
    random = RandomSpaces.new(3)
    assert_instance_of(RandomSpaces, random)
  end

  def test_it_has_length
    random = RandomSpaces.new(3)
    assert_equal(3, random.length)
  end

  def test_it_starts_with_no_spaces
    random = RandomSpaces.new(3)
    assert_equal([], random.spaces)
  end

end
