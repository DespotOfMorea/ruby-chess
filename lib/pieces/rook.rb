class Rook < Piece
  def initialize(window,player=true,square=nil)
    super
    @@type = "Rook"
    if @player
      @image = Gosu::Image.new("media/rook_w.png")
    else
      @image = Gosu::Image.new("media/rook_b.png")
    end
  end

  def captured
    if @player
      @x = 1050
      @y = 850
    else
      @x = 1050
      @y = 150
    end
    @square=0
   end
end
