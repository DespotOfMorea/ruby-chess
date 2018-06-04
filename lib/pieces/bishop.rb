class Bishop < Piece
  def initialize(window,player=true,square=nil)
    super
    @name = "Bishop"
    if @player
      @image = Gosu::Image.new("media/bishop_w.png")
    else
      @image = Gosu::Image.new("media/bishop_b.png")
    end
  end

   def captured
     if @player                            
      @x = 1050
      @y = 650
    else
      @x = 1050
      @y = 350
    end
    @square=nil
   end
end
