class Rook < Piece
  def initialize(player=true,square=nil)
    super
    @type = "rook"
    if @player
      @image = Gosu::Image.new("media/rook_w.png")
    else
      @image = Gosu::Image.new("media/rook_b.png")
    end
  end

  def captured
    @x = 1050
    if @player
      @y = 850
    else
      @y = 150
    end
    @square=0
   end
end
