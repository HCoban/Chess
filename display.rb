require 'byebug'
require 'colorize'
require_relative 'board'
require_relative 'cursorable'

class Display
  attr_reader :cursor_pos
  attr_accessor :board
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @selected = false
    @debug = false
  end

  def cursor
    @cursor_pos
  end

  def test
    until game_over?


    end

    render
    puts "GAME OVER"
  end

  def render

    system("clear")
    @board.grid.each_with_index do |row, i|
      print i
      row.each_with_index do |sqr, j|
        print sqr.to_s.colorize(colors([i,j]))
      end
      puts
    end
    if @debug
      puts "#{@board[@cursor_pos].moves}"
      puts "in check" if @board.in_check?(:black)
      puts "checkmate" if @board.checkmate?(:blcak)
    end
    return
  end

  def colors(pos)
    if !@board[pos].empty?
      color = @board[pos].color
    end

    if @cursor_pos == pos
      bg = :green
    elsif !@board[@cursor_pos].empty? && @board[@cursor_pos].moves.include?(pos)
      bg = :red
    else
      bg = :blue
    end
    return {:background => bg, :color => color}
  end

  def game_over?
    [:black, :white].each do |color|
      return true if @board.checkmate?(color)
    end
    false
  end
end
