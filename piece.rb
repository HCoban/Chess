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
    filter = []
    moves.each do |move|
      filter << move unless move_into_check?(move)
    end
    filter
  end

  def move_into_check?(pos)
    x = @board.dup
    x.move!(@pos, pos)
    x.in_check?(@color)
  end

end
