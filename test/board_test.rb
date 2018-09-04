## board_test.rb

require './test_helper'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
    assert_instance_of(Board, board)
  end

  def test_it_populates_maps_with_grid_spaces
    board = Board.new
    assert_equal(16, board.npc_map.count)
    assert_equal(16, board.player_map.count)
    actual = GridSpace
    expected = board.npc_map['A1']
    assert_instance_of(actual, expected)
  end

  def test_it_can_display_board
    board = Board.new
    expected =
    "==========\n. 1 2 3 4 \nA     \nB     \nC     \nD     \n==========\n. 1 2 3 4 \nA     \nB     \nC     \nD     \n=========="
    actual = board.display_board
    assert_equal(expected, actual)
  end

end
