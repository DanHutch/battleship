## board.rb


class Board
  attr_reader

  def initialize(player)
    @npc_header_line    = ". 1 2 3 4"
    @npc_a_line         = "A        "
    @npc_b_line         = "B        "
    @npc_c_line         = "C        "
    @npc_header_line    = "D        "
    @middle_border      = "=========="
    @player_header_line = ". 1 2 3 4"
    @player_a_line      = "A        "
    @player_b_line      = "B        "
    @player_c_line      = "C        "
    @player_d_line      = "D        "
    @bottom_border      = "=========="
  end



  def populate_spaces


  end

end
