require_relative 'constants'

module Methods
  include Constants
  def square_2_xy(square_name)
    if square_name!=nil
      a=LETTERS.index(square_name[0])
      a=a*DIM+W_SIDE+W_BORDER
      b=8-square_name[1].to_i
      b=b*DIM+W_TOP+W_BORDER+DIM/2
      return a,b
    end
  end
end
