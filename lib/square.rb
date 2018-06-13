require_relative 'constants'
class Square
  include Constants
  attr_reader :name, :colour, :file, :rank
  attr_accessor :piece, :selected
  def initialize(window,file,rank,callback,x=0,y=0,colour=true,piece=nil)
    @window=window
    @piece=piece
    @file=file
    @rank=rank
    @name="#{file}#{rank}"
    @callback = callback
    @x=x
    @y=y
    @colour=colour
    @selected=false
    @paint=COL_F_W
    if !@colour
      @paint = COL_F_B
    end
    @active_paint=@paint
  end

  def add_piece(piece)
    @piece=piece
    piece.move(self)
  end



  def hover?
    mx = @window.mouse_x
    my = @window.mouse_y
    (mx >= @x and my >= @y) and (mx <= @x + DIM) and (my <= @y + DIM)
  end

  def clicked
    if hover? then
      @callback.call(@name)
      @selected=true
    else
      @selected=false
    end
  end

  def update
    if hover? then
      @active_paint=COL_A
    elsif @selected
      @active_paint=COL_S
    else
      @active_paint=@paint
    end
  end

  def draw
    @window.draw_quad(@x,@y,@active_paint,
                    @x,@y+DIM,@active_paint,
                    @x+DIM,@y+DIM,@active_paint,
                    @x+DIM,@y,@active_paint)

    @window.draw_quad(@x+F_BORDER,@y+F_BORDER,@paint,
                  @x+F_BORDER,@y+DIM-F_BORDER,@paint,
                  @x+DIM-F_BORDER,@y+DIM-F_BORDER,@paint,
                  @x+DIM-F_BORDER,@y+F_BORDER,@paint)
  end
end
