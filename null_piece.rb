require 'singleton'


class NullPiece
  include Singleton

  def empty?
    true
  end

  def to_s
    "  "
  end

  def color
    nil
  end

  def moves
  end
end
