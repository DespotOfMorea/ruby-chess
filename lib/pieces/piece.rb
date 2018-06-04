class Piece

  def initialize(window,player=true,square=nil,x=0,y=0)
    @window=window
    @@type="Piece"
    @player=player
    @square=square
    @x=x
    @y=y
    @prev_square=nil
    @image=Gosu::Image.new("media/fig.png")    
  end

  def move
    @x=150
    @y=300
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
