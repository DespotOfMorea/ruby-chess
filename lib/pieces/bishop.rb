class Bishop < Piece
  def initialize(player=true,square=nil)
    super
    @name = "bishop"
    if @player
      @image = Gosu::Image.new("media/bishop_w.png")
    else
      @image = Gosu::Image.new("media/bishop_b.png")
    end
  end

   def captured
     @x = 1050
     if @player
      @y = 650
    else
      @y = 350
    end
    @square=nil
   end
end
