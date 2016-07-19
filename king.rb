require_relative 'piece'
require_relative 'stepable'

class King < Piece
  include Stepable

  def symbol
    "♔ "
  end

  def move_diffs
    [[1,0], [0,1], [-1,0], [0,-1], [1,1], [-1,1], [1,-1], [-1, -1]]
  end

end
