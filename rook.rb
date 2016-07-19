require_relative 'sliding_piece'

class Rook < Piece
  include Slideable

  def move_dirs
    {:diagonal => false, :horizontal => true}
  end

  def symbol
    "R" # ♗
  end

end
