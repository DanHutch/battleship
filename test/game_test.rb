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



end
