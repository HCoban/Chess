require_relative 'sliding_piece'
require_relative 'piece'


class Queen < Piece
  include Slideable

  def move_dirs
    {:diagonal => true, :horizontal => true}
  end

  def symbol
    "♕ "
  end

end
