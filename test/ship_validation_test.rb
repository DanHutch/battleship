## ship_2_validation_test.rb

require './test_helper'
require './lib/ship_validation'

class ShipValidationTest < Minitest::Test

  def test_it_exists
    validation = ShipValidation.new(2)
    assert_instance_of(ShipValidation, validation)
  end

  def test_it_has_valid_2_sets
    validation = ShipValidation.new(2)
    expected = [
      ["A1", "A2"], ["A2", "A3"], ["A3", "A4"],
      ["B1", "B2"], ["B2", "B3"], ["B3", "B4"],
      ["C1", "C2"], ["C2", "C3"], ["C3", "C4"],
      ["D1", "D2"], ["D2", "D3"], ["D3", "D4"],
      ["A1", "B1"], ["A2", "B2"], ["A3", "B3"], ["A4", "B4"],
      ["B1", "C1"], ["B2", "C2"], ["B3", "C3"], ["B4", "C4"],
      ["C1", "D1"], ["C2", "D2"], ["C3", "D3"], ["C4", "D4"]]
    assert_equal(expected, validation.valid_sets_2)
  end

  def test_it_has_valid_3_sets
    validation = ShipValidation.new(3)
    expected = [
      ["A1", "A2", "A3"], ["A2", "A3", "A4"],
      ["B1", "B2", "B3"], ["B2", "B3", "B4"],
      ["C1", "C2", "C3"], ["C2", "C3", "C4"],
      ["D1", "D2", "D3"], ["D2", "D3", "D4"],
      ["A1", "B1", "C1"], ["A2", "B2", "C2"],
      ["A3", "B3", "C3"], ["A4", "B4", "C4"],
      ["B1", "C1", "D1"], ["B2", "C2", "D2"],
      ["B3", "C3", "D3"], ["B4", "C4", "D4"]]
    assert_equal(expected, validation.valid_sets_3)
  end

  def test_it_knows_which_set_to_use
    validation = ShipValidation.new(3)
    expected = [
      ["A1", "A2", "A3"], ["A2", "A3", "A4"],
      ["B1", "B2", "B3"], ["B2", "B3", "B4"],
      ["C1", "C2", "C3"], ["C2", "C3", "C4"],
      ["D1", "D2", "D3"], ["D2", "D3", "D4"],
      ["A1", "B1", "C1"], ["A2", "B2", "C2"],
      ["A3", "B3", "C3"], ["A4", "B4", "C4"],
      ["B1", "C1", "D1"], ["B2", "C2", "D2"],
      ["B3", "C3", "D3"], ["B4", "C4", "D4"]]
    assert_equal(expected, validation.valid_sets)
    validation_2 = ShipValidation.new(2)
    expected = [
      ["A1", "A2"], ["A2", "A3"], ["A3", "A4"],
      ["B1", "B2"], ["B2", "B3"], ["B3", "B4"],
      ["C1", "C2"], ["C2", "C3"], ["C3", "C4"],
      ["D1", "D2"], ["D2", "D3"], ["D3", "D4"],
      ["A1", "B1"], ["A2", "B2"], ["A3", "B3"], ["A4", "B4"],
      ["B1", "C1"], ["B2", "C2"], ["B3", "C3"], ["B4", "C4"],
      ["C1", "D1"], ["C2", "D2"], ["C3", "D3"], ["C4", "D4"]]
    assert_equal(expected, validation_2.valid_sets)
  end

end
