require_relative 'constants'
class Player
  include Constants
  attr_reader :colour, :name, :pieces
  def initialize(colour)
    @colour = colour
    @name = 'White'
    @name = 'Black' unless @colour
    @check = false
    @pieces = []
    create_pieces
  end

  def create_pieces
    (0..7).each do |_i|
      @pieces.push Pawn.new(@colour)
    end
    (0..1).each do |_i|
      @pieces.push Rook.new(@colour)
      @pieces.push Knight.new(@colour)
      @pieces.push Bishop.new(@colour)
    end
    @pieces.push Queen.new(@colour)
    @pieces.push King.new(@colour)
  end

  def move_piece(piece, square)
    piece.square.remove_piece
    square.add_piece(piece)
  end

  def castling(piece, square, squares)
    king = nil
    rook = nil
    if piece.type == 'king'
      king = piece
      rook = square.piece
    else
      king = square.piece
      rook = piece
    end

    if rook.square.file == 'a' && castling_long_empty(squares)
      castling_long(king, rook, squares)
      return true
    elsif rook.square.file == 'h' && castling_short_empty(squares)
      castling_short(king, rook, squares)
      return true
    else
      return false
    end
  end

  def castling_long(king, rook, squares)
    king_square = nil
    rook_square = nil
    if @colour
      king_square = squares['c1']
      rook_square = squares['d1']
    else
      king_square = squares['c8']
      rook_square = squares['d8']
    end
    castling_finish(king, king_square, rook, rook_square)
  end

  def castling_long_empty(squares)
    rank = nil
    rank = if @colour
             1
           else
             8
           end
    status = true
    (1..3).each do |i|
      s = "#{LETTERS[i]}#{rank}"
      status = false unless squares[s].piece.nil?
    end
    status
  end

  def castling_short(king, rook, squares)
    king_square = nil
    rook_square = nil
    if @colour
      king_square = squares['g1']
      rook_square = squares['f1']
    else
      king_square = squares['g8']
      rook_square = squares['f8']
    end
    castling_finish(king, king_square, rook, rook_square)
  end

  def castling_short_empty(squares)
    rank = nil
    rank = if @colour
             1
           else
             8
           end
    status = true
    (5..6).each do |i|
      s = "#{LETTERS[i]}#{rank}"
      status = false unless squares[s].piece.nil?
    end
    status
end

  def castling_finish(king, king_square, rook, rook_square)
    move_piece(king, king_square)
    move_piece(rook, rook_square)
  end

  def draw
    @pieces.length.times do |i|
      @pieces[i].draw
    end
  end
end
