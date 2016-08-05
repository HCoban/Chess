require_relative "board"
require_relative "player"

class Game

  def initialize
    @board = Board.new
    @d = Display.new(@board)
    @player_1 = HumanPlayer.new("Player 1", @d, :white)
    @player_2 = HumanPlayer.new("Player 2", @d, :black)
    @current_player = @player_1
  end

  def play
    until @d.game_over?
      @current_player.play_turn
      switch_players
    end
  end

  def switch_players
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
