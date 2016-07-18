class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) {Array.new(8)}
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def move(start, end_pos)
    self[end_pos] = self[start]
    self[start] = nil
    begin
      if self[start].nil? # || self[end_pos]
        raise ArgumentError.new "Start position is empty"
      end
    rescue ArgumentError => e
      puts e.message
    end
  end

end
