require_relative 'piece'
require_relative 'null_piece'
require_relative 'display'
require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'
require_relative 'queen'
require_relative 'rook'


class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }
    populate
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def populate
    [[7, 0], [7, 7]].each do |pos|
      self[pos] = Rook.new(pos, self, :black)
    end

    [[7, 1], [7, 6]].each do |pos|
      self[pos] = Knight.new(pos, self, :black)
    end

    [[7, 2], [7, 5]].each do |pos|
      self[pos] = Bishop.new(pos, self, :black)
    end

    self[[7, 3]] = Queen.new([7, 3], self, :black)
    self[[7, 4]] = King.new([7, 4], self, :black)

    @grid[6].each_with_index do |row, i|
      self[[6, i]] = Pawn.new([6, i], self, :black)
    end

    [[0, 0], [0, 7]].each do |pos|
      self[pos] = Rook.new(pos, self, :white)
    end

    [[0, 1], [0, 6]].each do |pos|
      self[pos] = Knight.new(pos, self, :white)
    end

    [[0, 2], [0, 5]].each do |pos|
      self[pos] = Bishop.new(pos, self, :white)
    end

    self[[0, 3]] = Queen.new([0, 3], self, :white)
    self[[0, 4]] = King.new([0, 4], self, :white)

    @grid[1].each_with_index do |row, i|
      self[[1, i]] = Pawn.new([1, i], self, :white)
    end

  end

  def move(start, end_pos)

    begin
      if self[start].empty? || !self[start].moves.include?(end_pos)
        raise ArgumentError.new "Invalid move!"
      elsif !self[start].valid_moves.include?(end_pos)
        raise ArgumentError.new "This move would put you in check!"
      end
    rescue ArgumentError => e
      puts e.message
      sleep(1)
      return
    end

    self[end_pos] = self[start]
    self[end_pos].pos = end_pos
    self[start] = NullPiece.instance
  end

  def move!(start, end_pos)
    begin
      if self[start].empty? || !self[start].moves.include?(end_pos)
        raise ArgumentError.new "Start position is empty"
      end
    rescue ArgumentError => e
      puts e.message
      return
    end

    self[end_pos] = self[start]
    self[end_pos].pos = end_pos
    self[start] = NullPiece.instance
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def in_check?(color)
    king_pos = []
    @grid.each_with_index do |row, i|
      row.each_with_index do |sq, j|
        if sq.color == color && sq.class == King
          king_pos = [i, j]
          break
        end
      end
    end

    @grid.each_with_index do |row, i|
      row.each_with_index do |sq, j|
        next if sq.color == color || sq.color.nil?
        return true if sq.moves.include?(king_pos)
      end
    end
    false
  end

  def checkmate?(color)
    return false unless in_check?(color)

    @grid.each do |col|
      col.each do |sq|
        next unless sq.color == color
        return false unless sq.valid_moves.empty?
      end
    end
    true
  end

  def dup
    result = Board.new
    @grid.each_with_index do |col, i|
      col.each_with_index do |sq, j|
        if sq.class == NullPiece
          result[[i, j]] = NullPiece.instance
        else
          result[[i, j]] = sq.class.new([i, j], result, sq.color)
        end
      end
    end
    result
  end
end



if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  # b[[3,5]] = King.new([3, 5], b, :white)
  # b[[7,7]] = Rook.new([7, 7], b, :white)
  # b[[1,7]] = King.new([1, 7], b, :black)
  # b[[2,2]] = Bishop.new([2,2], b, :white)
  # b[[1,0]] = Rook.new([1,0], b, :black)
  # b[[5,7]] = Queen.new([5,7], b, :white)
  #
  # b[[5,6]] = Pawn.new([5,6], b, :white)
  # b[[7,7]] = Knight.new([7,7], b, :white)
  d.test
end
