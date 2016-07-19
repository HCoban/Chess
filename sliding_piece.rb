module Slideable

  def moves
    moves = []
    7.times do |i|
      moves << grow_unblocked_moves_dir(i, i)
    end
    moves.map! do |move|
      [move.first + @pos.first, move[1] + @pos[1]]
    end
  end

  private

  def horizontal_dirs
    [ [0,1], [0,-1], [-1,0], [1,0] ]
  end

  def diagonal_dirs
    [[1,1], [1,-1], [-1,-1], [-1,1]]
  end

  def grow_unblocked_moves_dir(dx, dy)
    moves = []
    if move_dirs[:horizontal]
      moves << horizontal_dirs
    if move_dirs[:diagonal]
      moves << diagonal_dirs
    end

    moves.map! do |move|
      [move.first * dx, move[1] * dy]
    end
  end

  def move_dirs
  end



end
