require "byebug"
module Stepable

  def moves
    moves = []
    move_diffs.each do |move|
      next_move = [move[0] + @pos[0], move[1] + @pos[1]]
      next unless @board.in_bounds?(next_move)
      next if @board[next_move].color == self.color
      moves << next_move
    end
    moves
  end

  def move_diffs
  end

end
