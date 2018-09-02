## board_test.rb

require './test/test_helper'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
    assert_instance_of(Board, board)
  end

  def test_it_populates_rows_with_grid_spaces
    board = Board.new
    assert_equal(4, board.npc_a_row.count)
    assert_equal(4, board.npc_b_row.count)
    assert_equal(4, board.npc_c_row.count)
    assert_equal(4, board.npc_d_row.count)
    assert_equal(4, board.player_a_row.count)
    assert_equal(4, board.player_b_row.count)
    assert_equal(4, board.player_c_row.count)
    assert_equal(4, board.player_d_row.count)
    actual = GridSpace
    expected = board.npc_a_row['A1']
    assert_instance_of(actual, expected)
  end

  def test_it_can_render_and_display_map
    board = Board.new
    p board.display_map
    expected =
    "==========\n. 1 2 3 4 \nA     \nB     \nC     \nD     \n==========\n. 1 2 3 4 \nA     \nB     \nC     \nD     \n=========="
    actual = board.display_map
    assert_equal(expected, actual)
  end

end
