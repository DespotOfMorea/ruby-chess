require_relative 'constants'
class Game
  include Constants
  def initialize(window)
    @window = window
    @turn = true
    @white = Player.new(true)
    @black = Player.new(false)
    @active_piece = nil
    @board = @window.board
    @board.callback = method(:gameplay)
    @board.make_squares
    @status_bar = @window.status_bar
    new_game
  end

  # @status_bar.text="User clicked on #{a} square."
  # @status_bar.empty_square(square)
  # @status_bar.piece_picked(@white,square.piece)

  def gameplay(a)
    if !a.nil?
      square = @board.squares[a]
      check_square(square)

    else
      out_of_bounds
    end
  end

  def out_of_bounds
    @status_bar.out_of_bounds
  end

  def check_square(square)
    if square.piece.nil?
      unoccupied_square(square)
    else
      occupied_square(square)
    end
  end

  def unoccupied_square(square)
    if !@active_piece.nil?
      correct_move?(square)

    else
      @status_bar.vacant_square(square)
    end
  end

  def occupied_square(square)
    player = @black
    player = @white if @turn
    if square.piece.player == @turn && !@active_piece.nil? && castling?(square)
      if player.castling(@active_piece, square, @board.squares)
        @status_bar.castling_succ
        end_turn
      else
        @status_bar.castling_not
      end

    elsif square.piece.player == @turn

      @active_piece = square.piece

      @status_bar.piece_picked(player, @active_piece)
    else
      other_colour_piece(square, player)
    end
  end

  def other_colour_piece(square, player)
    if !@active_piece.nil?
      correct_move?(square)
    else
      @status_bar.wrong_piece_colour(player)
    end
  end

  def correct_move?(square)
    if @active_piece.correct_move(square, @board.squares)

      player = @black
      player = @white if @turn
      player.move_piece(@active_piece, square)

      end_turn
    else
      @status_bar.wrong_move
    end
  end

  def castling?(square)
    if (@active_piece.type == 'rook' && square.piece.type == 'king') || (@active_piece.type == 'king' && square.piece.type == 'rook')
      if @active_piece.prev_square.nil? && square.piece.prev_square.nil?
        true
      else
        false
      end
    else
      false
    end
  end

  def end_turn
    @turn = !@turn
    @active_piece = nil
  end

  def clicked
    @board.clicked
  end

  def update
    @board.update
    @status_bar.update
  end

  def draw
    @board.draw
    @status_bar.draw
    @white.draw
    @black.draw
  end

  def new_game
    add_player(@white)
    add_player(@black)
    @turn = true
    @active_piece = nil
  end

  def add_player(player)
    colour = player.colour
    rank = 7
    rank = 2 if colour
    (0..7).each do |i|
      name = "#{LETTERS[i]}#{rank}"
      square = @board.squares[name]
      square.add_piece(player.pieces[i])
    end
    rank = 8
    rank = 1 if colour
    (0..1).each do |i|
      piece_num = 8
      name = "#{LETTERS[i * 7]}#{rank}"
      square = @board.squares[name]
      square.add_piece(player.pieces[piece_num + i * 3])
      name = "#{LETTERS[1 + i * 5]}#{rank}"
      square = @board.squares[name]
      square.add_piece(player.pieces[piece_num + 1 + i * 3])
      name = "#{LETTERS[2 + i * 3]}#{rank}"
      square = @board.squares[name]
      square.add_piece(player.pieces[piece_num + 2 + i * 3])
    end
    name = "#{LETTERS[3]}#{rank}"
    square = @board.squares[name]
    square.add_piece(player.pieces[14])
    name = "#{LETTERS[4]}#{rank}"
    square = @board.squares[name]
    square.add_piece(player.pieces[15])
  end
end
