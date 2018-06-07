class Pawn < Piece
  def initialize(player=true,square=nil)
    super
    @type = "pawn"
    if @player
      @image = Gosu::Image.new("media/pawn_w.png")
    else
      @image = Gosu::Image.new("media/pawn_b.png")
    end
  end
end
