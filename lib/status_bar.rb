require_relative 'constants'

class StatusBar
  include Constants

  attr_accessor :text
  def initialize(window, x = 0, y = 0, text = 'White player is on the move.')
    @window = window
    @text = text
    @x = x
    @y = y
  end

  def on_move(player)
    @text = "#{player.name} player is on the move."
  end

  def vacant_square(square)
    @text = "There is no piece on #{square.name} square."
  end

  def wrong_move
    @text = 'Selected piece cannot move that way.'
  end

  def castling_succ
    @text = 'Castling successfull.'
  end

  def castling_not
    @text = 'Bad castling.'
  end

  def wrong_piece_colour(player)
    @text = "#{player.name} player is on the move, select your piece first."
  end

  def piece_picked(player, piece)
    @text = "#{player.name} player selected #{piece.type} from #{piece.square.name} square."
  end

  def out_of_bounds
    @text = 'You clicked outside of chessboard. Please pick a piece or a square.'
  end

  def update; end

  def draw
    display = Gosu::Font.new(@window, Gosu.default_font_name, 25)
    display.draw(@text, @x, @y, 1.0, 1.0, 1.0, COL_N)
  end
end
