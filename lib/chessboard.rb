require_relative 'constants'

class ChessBoard
  include Constants
  DIM_TABLE=8*DIM+2*W_BORDER                      # Size chessboard.
  attr_accessor :squares, :callback
  def initialize(window,x=0,y=0)
    @window=window
    @callback
    @x=x
    @y=y
    @squares=Hash.new
#    make_squares
  end

  def add_square (window, file, rank, callback, x=0, y=0, colour=true, piece=nil)
    square = Square.new(window,file,rank,callback,x,y,colour, piece)
    @squares[square.name]=square
    self
  end

  def make_squares
    for i in [1,3,5,7]
      for j in [0,2,4,6]
        add_square(@window,"#{LETTERS[i]}",8-j,@callback,@x+W_BORDER+i*DIM,@y+W_BORDER+j*DIM,false)
        add_square(@window,"#{LETTERS[j]}",8-i,@callback,@x+W_BORDER+j*DIM,@y+W_BORDER+i*DIM,false)

        add_square(@window,"#{LETTERS[j]}",9-i,@callback,@x+W_BORDER+j*DIM,@y+W_BORDER+i*DIM-DIM)
        add_square(@window,"#{LETTERS[j+1]}",8-i,@callback,@x+W_BORDER+j*DIM+DIM,@y+W_BORDER+i*DIM)
      end
    end
  end

  def clicked
    if !inside?
      @callback.call(nil)
    else
      @squares.each_value {|value| value.clicked }
    end
  end

  def inside?
    mx = @window.mouse_x
    my = @window.mouse_y
    (mx >= @x + W_BORDER and my >= @y + W_BORDER) and (mx <= @x + W_BORDER + 8*DIM) and (my <= @y + W_BORDER + 8*DIM)
  end

  def update
    @squares.each_value {|value| value.update }
  end

  def draw
    @window.draw_quad(@x,@y,COL_F_B,
                      @x,@y+DIM_TABLE,COL_F_B,
                      @x+DIM_TABLE,@y+DIM_TABLE,COL_F_B,
                      @x+DIM_TABLE,@y,COL_F_B)
    @window.draw_quad(@x+W_BORDER-W_BORDER_S,@y+W_BORDER-W_BORDER_S,COL_F_W,
                      @x+W_BORDER-W_BORDER_S,@y+DIM_TABLE-W_BORDER+W_BORDER_S,COL_F_W,
                      @x+DIM_TABLE-W_BORDER+W_BORDER_S,@y+DIM_TABLE-W_BORDER+W_BORDER_S,COL_F_W,
                      @x+DIM_TABLE-W_BORDER+W_BORDER_S,@y+W_BORDER-W_BORDER_S,COL_F_W)
  # Adding ranks/rows numbers and files/columns letters marks on chessboard.
    for i in 1..8
      numbers = Gosu::Font.new(@window, Gosu.default_font_name, 25)
      numbers.draw(i,@x+20, @y+DIM_TABLE-i*DIM-10,1.0, 1.0, 1.0,COL_N)
      numbers.draw(i,@x+DIM_TABLE-30,@y+DIM_TABLE-i*DIM-10,1.0, 1.0, 1.0,COL_N)
      letters = Gosu::Font.new(@window, Gosu.default_font_name, 25)
      letters.draw(LETTERS[i-1],@x+i*DIM,@y+15,1.0, 1.0, 1.0,COL_N)
      letters.draw(LETTERS[i-1],@x+i*DIM,@y+DIM_TABLE-35,1.0, 1.0, 1.0,COL_N)
    end
    @squares.each_value {|value| value.draw }
  end
end
