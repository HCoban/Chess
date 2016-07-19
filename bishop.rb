require_relative 'sliding_piece'

class Bishop < Piece
  include Slideable

  def move_dirs
    {:diagonal => true, :horizontal => false}
  end

  def symbol
    "B" # ♗
  end

end
