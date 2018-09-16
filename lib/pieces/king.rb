class King < Piece
  def initialize(player = true, square = nil)
    super
    @type = 'king'
    @image = if @player
               Gosu::Image.new('media/king_w.png')
             else
               Gosu::Image.new('media/king_b.png')
             end
  end

  def correct_move(_square, _squares)
    rank_diff = _square.rank - @square.rank
    file_diff = LETTERS.index(_square.file) - LETTERS.index(@square.file)
    if (rank_diff.abs <= 1) && (file_diff.abs <= 1)
      return true
    else
      return false
      end
    true
  end
end
