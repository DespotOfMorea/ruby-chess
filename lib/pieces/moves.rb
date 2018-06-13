require_relative '../constants'

module Moves
    include Constants

  def correct_move_pawn(new_square,old_square)
    player=old_square.piece.player
    if new_square.piece==nil
      return pawn_move(new_square,old_square,player)
    else
      return pawn_capture(new_square,old_square,player)
    end
  end

  def pawn_move(new_square,old_square,player)
    rank_diff=new_square.rank-old_square.rank
    if new_square.file!=old_square.file
      return false
    elsif rank_diff.abs>2
      return false
    elsif rank_diff=2 && player && old_square.rank==2
      return true
    elsif rank_diff=-2 && !player && old_square.rank==7
      return true
    elsif rank_diff=1 && player
      return true
    elsif rank_diff=-1 && !player
      return true
    else
      return false
    end
  end







  def pawn_capture(new_square,old_square,colour)

  end




end
