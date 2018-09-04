## ship_2.rb

require 'pry'
require './lib/board'


class Ship
  attr_reader :owner,
              :length,
              :spaces,
              :damage

  def initialize(owner, spaces)
    @owner = owner
    @length = spaces.count
    @spaces = spaces
    @damage = 0
  end

  def hit
    @damage += 1
  end

  def sunk?
    @damage == @length
  end

end
