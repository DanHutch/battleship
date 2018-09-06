## random_spaces.rb

require './lib/ship_validation'
require 'pry'

class RandomSpaces
  attr_reader :coordinates

  def initialize
    @coordinates = []
  end

  def get_random_sets
    random_2_set
    random_3_set
  end

  def random_2_set
    sets = ShipValidation.new(2).valid_sets
    @coordinates << sets.sample
  end

  def random_3_set
    sets = ShipValidation.new(3).valid_sets
    valid_set = []
    loop do
      current_set = sets.sample
      if valid?(current_set)
        valid_set = current_set
        break
      end
    end
    @coordinates << valid_set
  end

  def valid?(set)
    set.all? do |space|
      !@coordinates.flatten.include?(space)
    end
  end

end
