class Queen < Piece
  def initialize(window,player=true,square=nil)
    super
    @name = "Queen"
    if @player
      @image = Gosu::Image.new("media/queen_w.png")
    else
      @image = Gosu::Image.new("media/queen_b.png")
    end
  end

  def captured
    if @player
      @x = 1050
      @y = 550
    else
      @x = 1050
      @y = 450
    end
    @square=nil
  end
end
