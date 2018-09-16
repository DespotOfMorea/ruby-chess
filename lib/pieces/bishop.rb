class Bishop < Piece
  def initialize(player = true, square = nil)
    super
    @type = 'bishop'
    @image = if @player
               Gosu::Image.new('media/bishop_w.png')
             else
               Gosu::Image.new('media/bishop_b.png')
             end
  end

  def correct_move(square, squares)
    correct_move_bishop(square, @square, squares)
  end

  def captured
    @x = W_WIDTH - W_SIDE / 2
    @y = if @player
           W_HEIGHT / 2 + DIM * 1.5
         else
           W_HEIGHT / 2 - DIM * 1.5
         end
    @square = nil
  end
end
