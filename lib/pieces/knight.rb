class Knight < Piece
  def initialize(player = true, square = nil)
    super
    @type = 'knight'
    @image = if @player
               Gosu::Image.new('media/knight_w.png')
             else
               Gosu::Image.new('media/knight_b.png')
             end
  end

  def correct_move(square, _squares)
    correct_move_knight(square, @square)
  end

  def captured
    @x = W_WIDTH - W_SIDE / 2
    @y = if @player
           W_HEIGHT / 2 + DIM * 2.5
         else
           W_HEIGHT / 2 - DIM * 2.5
         end
    @square = nil
   end
end
