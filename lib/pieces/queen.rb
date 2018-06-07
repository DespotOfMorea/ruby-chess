class Queen < Piece
  def initialize(player=true,square=nil)
    super
    @name = "queen"
    if @player
      @image = Gosu::Image.new("media/queen_w.png")
    else
      @image = Gosu::Image.new("media/queen_b.png")
    end
  end

  def captured
    @x = 1050
    if @player
      @y = 550
    else
      @y = 450
    end
    @square=nil
  end
end
