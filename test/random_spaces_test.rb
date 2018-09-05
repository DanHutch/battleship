## random_spaces_test.rb

require './test_helper'
require './lib/random_spaces'

class RandomSpacesTest < Minitest::Test

  def test_it_exists
    random = RandomSpaces.new
    assert_instance_of(RandomSpaces, random)
  end

  def test_it_starts_with_no_spaces
    random = RandomSpaces.new
    assert_equal([], random.coordinates)
  end

  def test_it_can_get_random_set_of_2
    random = RandomSpaces.new
    random.random_2_set
    assert_equal(1, random.coordinates.count)
    assert_equal(2, random.coordinates[0].count)
  end

  def test_it_can_get_random_set_of_3
    random = RandomSpaces.new
    random.random_3_set
    assert_equal(1, random.coordinates.count)
    assert_equal(3, random.coordinates[0].count)
  end

  def test_it_can_do_both_without_conflict
    random = RandomSpaces.new
    random.random_2_set
    assert_equal(1, random.coordinates.count)
    assert_equal(2, random.coordinates[0].count)
    random.random_3_set
    assert_equal(2, random.coordinates.count)
    assert_equal(3, random.coordinates[1].count)
  end

end
