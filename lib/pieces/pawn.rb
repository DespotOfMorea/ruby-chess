class Pawn < Piece
  def initialize(window,player=true,square=nil)
    super
    @@type = "Pawn"
    if @player
      @image = Gosu::Image.new("media/pawn_w.png")
    else
      @image = Gosu::Image.new("media/pawn_b.png")
    end
  end
end
