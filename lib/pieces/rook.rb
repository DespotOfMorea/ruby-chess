class Rook < Piece
  def initialize(player = true, square = nil)
    super
    @type = 'rook'
    @image = if @player
               Gosu::Image.new('media/rook_w.png')
             else
               Gosu::Image.new('media/rook_b.png')
             end
  end

  def correct_move(square, squares)
    correct_move_rook(square, @square, squares)
  end

  def captured
    @x = W_WIDTH - W_SIDE / 2
    @y = if @player
           W_HEIGHT / 2 + DIM * 3.5
         else
           W_HEIGHT / 2 - DIM * 3.5
         end
    @square = nil
   end
end
