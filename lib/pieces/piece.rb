require_relative '../methods'
require_relative 'moves'

class Piece
  include Methods
  include Moves
  attr_accessor :type, :player, :square
  def initialize(player = true, square = nil, x = 0, y = 0)
    #    @window=window
    @type = 'Piece'
    @player = player
    @square = square
    @x = x
    @y = y
    @prev_square = nil
    @image = Gosu::Image.new('media/fig.png')
  end

  def move1
    @x = 150
    @y = 300
  end

  def correct_move(_square, _squares)
    true
  end

  def move(square)
    @prev_square = @square
    @square = square
    a = square_2_xy(square.name)
    @x = a[0] + DIM / 2
    @y = a[1]
  end

  def captured
    r = Random.new
    b = r.rand(0...2)
    @x = W_SIDE / 2
    @y = if @player
           W_HEIGHT / 2 + DIM * 3.5 - b * DIM
         else
           W_HEIGHT / 2 - DIM * 3.5 + b * DIM
         end
    @square = nil
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end
end
