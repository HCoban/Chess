require_relative 'piece'

class Pawn < Piece

  def symbol
    "♙ "
  end

  def moves
    possible_steps = []
    forward_steps.each do |step|
      possible_steps << [@pos[0] + step[0], @pos[1] + step[1]]
    end

    possible_steps += side_attacks
  end

  protected

  def at_start_row?
    if color == :black && @pos.first == 1
      return true
    elsif color == :white && @pos.first == 6
      return true
    end
    false
  end

  def forward_dir
    if color == :black
      :north
    else
      :south
    end
  end

  def forward_steps
    if color == :white
      steps = [[1, 0]]
      if at_start_row?
        steps.push([2, 0])
      end
    else
      steps = [[-1, 0]]
      if at_start_row?
        steps.push([-2, 0])
      end
    end
    steps
  end

  def side_attacks
    moves = []
    if color == :black
      if @board[[@pos.first - 1, @pos[1] - 1]].color == :white
        moves << [@pos.first - 1, @pos[1] - 1]
      end
      if @board[[@pos.first - 1, @pos[1] + 1]].color == :white
        moves << [@pos.first - 1, @pos[1] + 1]
      end
    elsif color == :white
      if @board[[@pos.first + 1, @pos[1] - 1]].color == :black
        moves << [@pos.first + 1, @pos[1] - 1]
      end
      if @board[[@pos.first + 1, @pos[1] + 1]].color == :black
        moves << [@pos.first + 1, @pos[1] + 1]
      end
    end
    moves
  end
end
