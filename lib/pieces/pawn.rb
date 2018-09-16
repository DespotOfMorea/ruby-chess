class Pawn < Piece
  def initialize(player = true, square = nil)
    super
    @type = 'pawn'
    @image = if @player
               Gosu::Image.new('media/pawn_w.png')
             else
               Gosu::Image.new('media/pawn_b.png')
             end
  end

  def correct_move(square, _squares)
    correct_move_pawn(square, @square)
  end
end
