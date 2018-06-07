require_relative 'constants'

class Window <Gosu::Window
  include Constants
  attr_reader :board, :status_bar
  def initialize
    super W_WIDTH, W_HEIGHT
    self.caption = "Chess"
    #@board = ChessBoard.new(self,method(:gameplay),W_SIDE,W_TOP)
    @board = ChessBoard.new(self,W_SIDE,W_TOP)
    @status_bar=StatusBar.new(self,W_SIDE,W_TOP*1.25+8*DIM+2*W_BORDER)
    @game=Game.new(self)
  end

  def needs_cursor?
    return true                   # Basic state is false.
  end

  def button_down (id)
		if id == Gosu::MsLeft
			@game.clicked
		end
	end

  def update
    @game.update
  end

  def draw
      self.draw_quad(0,0,COL_B,
                        0,W_HEIGHT,COL_B,
                        W_WIDTH,W_HEIGHT,COL_B,
                        W_WIDTH,0,COL_B)
#      @board.draw
      @game.draw
#      @status.draw
  end
end
