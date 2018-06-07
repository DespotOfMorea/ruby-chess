class Knight < Piece
  def initialize(player=true,square=nil)
    super
    @type = "knight"
    if @player
      @image = Gosu::Image.new("media/knight_w.png")
    else
      @image = Gosu::Image.new("media/knight_b.png")
    end
  end

  def captured
    @x = 1050
    if @player
      @y = 750
    else
      @y = 250
    end
    @square=0
   end
end
