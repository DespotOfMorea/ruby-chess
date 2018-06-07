class King < Piece
  def initialize(player=true,square=nil)
    super
    @type = "king"
    if @player
      @image = Gosu::Image.new("media/king_w.png")
    else
      @image = Gosu::Image.new("media/king_b.png")
    end
  end
end
