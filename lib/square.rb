require_relative 'constants'
class Square
  include Constants
  attr_reader :name, :colour, :file, :rank
  attr_accessor :piece, :selected
  def initialize(window, file, rank, callback, x = 0, y = 0, colour = true, piece = nil)
    @window = window
    @piece = piece
    @file = file
    @rank = rank
    @name = "#{file}#{rank}"
    @callback = callback
    @x = x
    @y = y
    @colour = colour
    @selected = false
    @paint = COL_F_W
    @paint = COL_F_B unless @colour
    @active_paint = @paint
  end

  def add_piece(piece)
    @piece = piece
    piece.move(self)
  end

  def remove_piece
    @piece = nil
  end

  def capture_piece
    unless @piece.nil?
      @piece.captured
      remove_piece
    end
  end

  def hover?
    mx = @window.mouse_x
    my = @window.mouse_y
    ((mx >= @x) && (my >= @y)) && (mx <= @x + DIM) && (my <= @y + DIM)
  end

  def clicked
    if hover?
      @callback.call(@name)
      @selected = true
    else
      @selected = false
    end
  end

  def update
    @active_paint = if hover?
                      COL_A
                    elsif @selected
                      COL_S
                    else
                      @paint
                    end
  end

  def draw
    @window.draw_quad(@x, @y, @active_paint,
                      @x, @y + DIM, @active_paint,
                      @x + DIM, @y + DIM, @active_paint,
                      @x + DIM, @y, @active_paint)

    @window.draw_quad(@x + F_BORDER, @y + F_BORDER, @paint,
                      @x + F_BORDER, @y + DIM - F_BORDER, @paint,
                      @x + DIM - F_BORDER, @y + DIM - F_BORDER, @paint,
                      @x + DIM - F_BORDER, @y + F_BORDER, @paint)
  end
end
