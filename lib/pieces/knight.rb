class Knight < Piece
  def initialize(window,player=true,square=nil)
    super
    @@type = "Knight"
    if @player
      @image = Gosu::Image.new("media/knight_w.png")
    else
      @image = Gosu::Image.new("media/knight_b.png")
    end
  end

  def captured
    if @player
      @x = 1050
      @y = 750
    else
      @x = 1050
      @y = 250
    end
    @square=0
   end
end
