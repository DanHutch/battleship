## board.rb

require './lib/grid_space'
require 'pry'

class Board
  attr_reader   :npc_a_row,
                :npc_b_row,
                :npc_c_row,
                :npc_d_row,
                :player_a_row,
                :player_b_row,
                :player_c_row,
                :player_d_row


  def initialize
    @npc_a_row          = {}
    @npc_b_row          = {}
    @npc_c_row          = {}
    @npc_d_row          = {}
    @player_a_row       = {}
    @player_b_row       = {}
    @player_c_row       = {}
    @player_d_row       = {}


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

    populate_all_rows
  end

  def display_map
    render_all_lines
    @top_border + @npc_header_line + @npc_a_line + @npc_b_line + @npc_c_line + @npc_d_line + @middle_border +
    @player_header_line + @player_a_line + @player_b_line + @player_c_line + @player_d_line + @bottom_border
  end

  def render_all_lines
    @npc_a_line     = "A " +
      @npc_a_row['A1'].visual + @npc_a_row['A2'].visual + @npc_a_row['A4'].visual + @npc_a_row['A4'].visual + "\n"

    @npc_b_line     = "B " +
      @npc_b_row['B1'].visual + @npc_b_row['B2'].visual + @npc_b_row['B4'].visual + @npc_b_row['B4'].visual + "\n"

    @npc_c_line     = "C " +
      @npc_c_row['C1'].visual + @npc_c_row['C2'].visual + @npc_c_row['C4'].visual + @npc_c_row['C4'].visual + "\n"

    @npc_d_line     = "D " +
      @npc_d_row['D1'].visual + @npc_d_row['D2'].visual + @npc_d_row['D4'].visual + @npc_d_row['D4'].visual + "\n"

    @player_a_line     = "A " +
      @player_a_row['A1'].visual + @player_a_row['A2'].visual + @player_a_row['A4'].visual + @player_a_row['A4'].visual + "\n"

    @player_b_line     = "B " +
      @player_b_row['B1'].visual + @player_b_row['B2'].visual + @player_b_row['B4'].visual + @player_b_row['B4'].visual + "\n"

    @player_c_line     = "C " +
      @player_c_row['C1'].visual + @player_c_row['C2'].visual + @player_c_row['C4'].visual + @player_c_row['C4'].visual + "\n"

    @player_d_line     = "D " +
      @player_d_row['D1'].visual + @player_d_row['D2'].visual + @player_d_row['D4'].visual + @player_d_row['D4'].visual + "\n"
  end

  def populate_all_rows
    populate_row(@npc_a_row, ['A1', 'A2', 'A3', 'A4'])
    populate_row(@npc_b_row, ['B1', 'B2', 'B3', 'B4'])
    populate_row(@npc_c_row, ['C1', 'C2', 'C3', 'C4'])
    populate_row(@npc_d_row, ['D1', 'D2', 'D3', 'D4'])
    populate_row(@player_a_row, ['A1', 'A2', 'A3', 'A4'])
    populate_row(@player_b_row, ['B1', 'B2', 'B3', 'B4'])
    populate_row(@player_c_row, ['C1', 'C2', 'C3', 'C4'])
    populate_row(@player_d_row, ['D1', 'D2', 'D3', 'D4'])
  end

  def populate_row(map_row, tile_set)
    tile_set.each do |tile_name|
      map_row[tile_name] = GridSpace.new(tile_name[0], tile_name[1].to_i)
    end
  end

end
