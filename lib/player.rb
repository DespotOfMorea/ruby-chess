class Player
  attr_reader :colour, :name, :pieces
  def initialize(colour)
    @colour=colour
    @name="White"
    if !@colour
      @name="Black"
    end
    @check=false
    @pieces=Array.new
    create_pieces
  end

  def create_pieces
    (0..7).each do |i|
      @pieces.push Pawn.new(@colour)
    end
   (0..1).each do |i|
     @pieces.push Rook.new(@colour)
     @pieces.push Knight.new(@colour)
     @pieces.push Bishop.new(@colour)
   end
   @pieces.push Queen.new(@colour)
   @pieces.push King.new(@colour)
  end

  def draw
    @pieces.length.times do |i|
      @pieces[i].draw
    end
  end
end
