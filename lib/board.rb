## board.rb

require './lib/grid_space'
require 'pry'

class Board
  attr_reader   :npc_map,
                :player_map

  def initialize
    @npc_map      = {}
    @player_map   = {}

    @top_border         = "==========\n"
    @npc_a_line         = ""
    @npc_b_line         = ""
    @npc_c_line         = ""
    @npc_d_line         = ""
    @npc_header_line    = ". 1 2 3 4 \n"
    @middle_border      = "==========\n"
    @player_header_line = ". 1 2 3 4 \n"
    @player_a_line      = ""
    @player_b_line      = ""
    @player_c_line      = ""
    @player_d_line      = ""
    @bottom_border      = "=========="

    populate_maps
  end

  def display_board
    render_all_lines
    @top_border + @npc_header_line + @npc_a_line + @npc_b_line + @npc_c_line + @npc_d_line + @middle_border + @player_header_line + @player_a_line + @player_b_line + @player_c_line + @player_d_line + @bottom_border
  end

  def render_all_lines
    @npc_a_line         = "A " +
      @npc_map['A1'].visual + " " + @npc_map['A2'].visual + " " + @npc_map['A4'].visual + " " + @npc_map['A4'].visual + "\n"

    @npc_b_line         = "B " +
      @npc_map['B1'].visual + " " + @npc_map['B2'].visual + " " + @npc_map['B3'].visual + " " + @npc_map['B4'].visual + "\n"

    @npc_c_line         = "C " +
      @npc_map['C1'].visual + " " + @npc_map['C2'].visual + " " + @npc_map['C3'].visual + " " + @npc_map['C4'].visual + "\n"

    @npc_d_line         = "D " +
      @npc_map['D1'].visual + " " + @npc_map['D2'].visual + " " + @npc_map['D3'].visual + " " + @npc_map['D4'].visual + "\n"

    @player_a_line      = "A " +
      @player_map['A1'].visual + " " + @player_map['A2'].visual + " " + @player_map['A3'].visual + " " + @player_map['A4'].visual + "\n"

    @player_b_line      = "B " +
      @player_map['B1'].visual + " " + @player_map['B2'].visual + " " + @player_map['B3'].visual + " " + @player_map['B4'].visual + "\n"

    @player_c_line      = "C " +
      @player_map['C1'].visual + " " + @player_map['C2'].visual + " " + @player_map['C3'].visual + " " + @player_map['C4'].visual + "\n"

    @player_d_line      = "D " +
      @player_map['D1'].visual + " " + @player_map['D2'].visual + " " + @player_map['D3'].visual + " " + @player_map['D4'].visual + "\n"
  end

  def populate_maps
    populate_map(@npc_map, [
      'A1', 'A2', 'A3', 'A4',
      'B1', 'B2', 'B3', 'B4',
      'C1', 'C2', 'C3', 'C4',
      'D1', 'D2', 'D3', 'D4'
      ])
    populate_map(@player_map, [
      'A1', 'A2', 'A3', 'A4',
      'B1', 'B2', 'B3', 'B4',
      'C1', 'C2', 'C3', 'C4',
      'D1', 'D2', 'D3', 'D4'])
  end

  def populate_map(map, tile_set)
    tile_set.each do |tile_name|
      map[tile_name] = GridSpace.new(tile_name[0], tile_name[1].to_i)
    end
  end

end
