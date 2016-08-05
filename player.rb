require_relative "display"

class HumanPlayer
  def initialize(name, display, color)
    @name = name
    @display = display
    @color = color
  end

  def play_turn
    pos = get_position
    target = get_target
    @display.board.move(pos, target)

  end

  def get_position
    begin
    pos = nil

    until pos
      @display.render
      pos = @display.get_input
    end

    if @display.board[pos].empty? || @color != @display.board[pos].color
      raise ArgumentError.new "Wrong color!"
    end
    rescue ArgumentError => e
      retry
    end
    pos
  end

  def get_target
    target = nil
    until target
      @display.render
      target = @display.get_input
    end
    target
  end
end
