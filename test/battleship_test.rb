## battleship_test.rb

require './test/test_helper'
require './lib/battleship'
require 'pry'

class BattleShipTest < Minitest::Test

  def test_it_exists
    battle = BattleShip.new
    assert_instance_of(BattleShip, battle)
  end


end
