class King < Piece
  def initialize(window,player=true,square=nil)
    super
    @@type = "King"
    if @player                                
      @image = Gosu::Image.new("media/king_w.png")
    else
      @image = Gosu::Image.new("media/king_b.png")
    end
  end
end
