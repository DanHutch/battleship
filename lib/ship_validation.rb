## ship_2_validation.rb

require 'pry'

class ShipValidation
  attr_reader :valid_sets_2,
              :valid_sets_3,
              :length

  def initialize(length)

    @length = length

    @valid_sets_2 = [
      ["A1", "A2"], ["A2", "A3"], ["A3", "A4"],
      ["B1", "B2"], ["B2", "B3"], ["B3", "B4"],
      ["C1", "C2"], ["C2", "C3"], ["C3", "C4"],
      ["D1", "D2"], ["D2", "D3"], ["D3", "D4"],
      ["A1", "B1"], ["A2", "B2"], ["A3", "B3"], ["A4", "B4"],
      ["B1", "C1"], ["B2", "C2"], ["B3", "C3"], ["B4", "C4"],
      ["C1", "D1"], ["C2", "D2"], ["C3", "D3"], ["C4", "D4"]]

    @valid_sets_3 = [
      ["A1", "A2", "A3"], ["A2", "A3", "A4"],
      ["B1", "B2", "B3"], ["B2", "B3", "B4"],
      ["C1", "C2", "C3"], ["C2", "C3", "C4"],
      ["D1", "D2", "D3"], ["D2", "D3", "D4"],
      ["A1", "B1", "C1"], ["A2", "B2", "C2"],
      ["A3", "B3", "C3"], ["A4", "B4", "C4"],
      ["B1", "C1", "D1"], ["B2", "C2", "D2"],
      ["B3", "C3", "D3"], ["B4", "C4", "D4"]]

  end

  def valid_sets
    if @length == 2
      @valid_sets_2
    elsif @length == 3
      @valid_sets_3
    end
  end

end
