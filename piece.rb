class Piece
  attr_reader :color
  
  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def to_s
    symbol
  end

  def empty?
    false
  end

  def valid_moves

  end
end
