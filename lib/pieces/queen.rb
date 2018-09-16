class Queen < Piece
  def initialize(player = true, square = nil)
    super
    @type = 'queen'
    @image = if @player
               Gosu::Image.new('media/queen_w.png')
             else
               Gosu::Image.new('media/queen_b.png')
             end
  end

  def correct_move(square, squares)
    if !correct_move_bishop(square, @square, squares)
      correct_move_rook(square, @square, squares)
    else
      true
    end
  end

  def captured
    @x = W_WIDTH - W_SIDE / 2
    @y = if @player
           W_HEIGHT / 2 + DIM * 0.5
         else
           W_HEIGHT / 2 - DIM * 0.5
         end
    @square = nil
  end
end
