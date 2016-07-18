require 'colorize'
require_relative 'board'
require_relative 'cursorable'

class Display
  attr_reader :cursor_pos
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @selected = false
  end

  def cursor
    @cursor_pos
  end

  def test
    self.get_input
  end

  def render
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |sqr, j|
        if [i, j] == @cursor_pos
          print sqr.to_a.colorize(:red)
        else
          print sqr
        end
      end
      puts
    end
  end

end
