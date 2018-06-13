require_relative '../methods'
require_relative 'moves'

class Piece
  include Methods
  include Moves
  attr_accessor :type, :player, :square
  def initialize(player=true,square=nil,x=0,y=0)
#    @window=window
    @type="Piece"
    @player=player
    @square=square
    @x=x
    @y=y
    @prev_square=nil
    @image=Gosu::Image.new("media/fig.png")
  end

  def move1
    @x=150
    @y=300
  end

  def correct_move(square,squares)
    return true
  end

  def move(square)
    @square=square
    a=square_2_xy(square.name)
    @x=a[0]+DIM/2
    @y=a[1]
  end

  def captured
    r = Random.new
    b=r.rand(0...2)
    if @colour
      @x = DIM/2
      @y = 850-b*DIM
    else
      @x = DIM/2
      @y = 150+b*DIM#@window.y_top+DIM/2+b*DIM
    end
    @field=nil
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end
end
