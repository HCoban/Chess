require_relative 'sliding_piece'
require_relative 'piece'


class Bishop < Piece
  include Slideable

  def move_dirs
    {:diagonal => true, :horizontal => false}
  end

  def symbol
    "♗ " 
  end

end
