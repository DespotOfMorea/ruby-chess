require_relative '../constants'

module Moves
  include Constants

  def correct_move_pawn(new_square, old_square)
    player = old_square.piece.player
    if new_square.piece.nil?
      return pawn_move(new_square, old_square, player)
    else
      return pawn_capture(new_square, old_square, player)
    end
  end

  def pawn_move(new_square, old_square, player)
    rank_diff = new_square.rank - old_square.rank
    if new_square.file != old_square.file
      return false
    elsif rank_diff.abs > 2
      return false
    elsif rank_diff = 2 && player && old_square.rank == 2
      return true
    elsif rank_diff = -2 && !player && old_square.rank == 7
      return true
    elsif rank_diff = 1 && player
      return true
    elsif rank_diff = -1 && !player
      return true
    else
      return false
    end
  end

  def pawn_capture(new_square, old_square, colour)
    rank_diff = new_square.rank - old_square.rank
    file_diff = LETTERS.index(new_square.file) - LETTERS.index(old_square.file)
    if file_diff.abs == 1
      if rank_diff == 1 && colour
        return true
      elsif rank_diff == -1 && !colour
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def correct_move_bishop(new_square, old_square, squares)
    rank_diff = new_square.rank - old_square.rank
    file_diff = LETTERS.index(new_square.file) - LETTERS.index(old_square.file)
    if rank_diff.abs == file_diff.abs
      r = new_square.rank
      f = LETTERS.index(new_square.file)
      d = rank_diff.abs - 1
      (1..d).each do |i|
        if rank_diff > 0 && file_diff > 0
          s = "#{LETTERS[f - i]}#{r - i}" # (a1 na h8),
        elsif rank_diff > 0 && file_diff < 0
          s = "#{LETTERS[f + i]}#{r - i}" # (h1 na a8),
        elsif rank_diff < 0 && file_diff < 0
          s = "#{LETTERS[f + i]}#{r + i}" # (h8 na a1),
        elsif rank_diff < 0 && file_diff > 0
          s = "#{LETTERS[f - i]}#{r + i}" # (a8 na h1),
        end
        return false unless squares[s].piece.nil?
      end
      return true
    else
      return false
    end
  end

  def correct_move_knight(new_square, old_square)
    rank_diff = new_square.rank - old_square.rank
    file_diff = LETTERS.index(new_square.file) - LETTERS.index(old_square.file)
    if rank_diff.abs == 1
      return true if file_diff.abs == 2
    elsif rank_diff.abs == 2
      return true if file_diff.abs == 1
    else
      return false
    end
  end

  def correct_move_rook(new_square, old_square, squares)
    if new_square.file == old_square.file                            # (a=a),
      r = new_square.rank - old_square.rank
      r = r.abs - 1
      (1..r).each do |i|
        s = if new_square.rank > old_square.rank
              "#{old_square.file}#{old_square.rank + i}"
            else
              "#{old_square.file}#{new_square.rank + i}"
            end
        return false unless squares[s].piece.nil?
      end
      true
    elsif new_square.rank == old_square.rank                         # (5=5),
      f = LETTERS.index(new_square.file) - LETTERS.index(old_square.file)
      f = f.abs - 1
      file = if LETTERS.index(new_square.file) > LETTERS.index(old_square.file)
               LETTERS.index(old_square.file)
             else
               LETTERS.index(new_square.file)
             end
      (1..f).each do |i|
        s = "#{LETTERS[file + i]}#{old_square.rank}"
        return false unless squares[s].piece.nil?
      end
      true
    else
      false
    end
  end
end
