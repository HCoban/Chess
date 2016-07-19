module Stepable

  def moves
    moves = []
    move_diffs.each do |move|
      moves << [move[0] + @pos[0], move[1] + @pos[1]]
    end
    moves
  end

  def move_diffs
  end

end
