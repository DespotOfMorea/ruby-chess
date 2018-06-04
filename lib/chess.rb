require 'rubygems'
require 'gosu'

require_relative 'window'
require_relative 'constants'
require_relative 'chessboard'
require_relative 'status_bar'
require_relative 'square'
require_relative 'pieces/piece'
require_relative 'pieces/pawn'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'

chess_window=Window.new
chess_window.show
