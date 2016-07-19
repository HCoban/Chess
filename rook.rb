require_relative 'sliding_piece'
require_relative 'piece'


class Rook < Piece
  include Slideable

  def move_dirs
    {:diagonal => false, :horizontal => true}
  end

  def symbol
    "♖ "
  end

end
