module Constants

  W_WIDTH=1100                                # Width of main window.
  W_HEIGHT=1000                               # Height of main window.
  W_TOP=50                                    # Height of top/bottom space around chessboard.
  W_SIDE=100                                  # Width of left/right space around chessboard.
  DIM=100                                     # Size of one chessboard square.
  W_BORDER=50                                 # Size of outer border of chessboard.
  W_BORDER_S=5                                # Size of inner border of chessboard.
  F_BORDER=5                                  # Size of active/selected border of square.

  COL_F_B=Gosu::Color.rgb(209,139,71)         # Colour of black/dark square on chessboard.
  COL_F_W=Gosu::Color.rgb(255,206,158)        # Colour of white/light square on chessboard.
  COL_B=Gosu::Color.rgb(255,178,102)          # Background colour of window.
  COL_N=Gosu::Color::BLACK                    # Colour of text/marks on chessboard.
  COL_A=Gosu::Color.rgb(204,0,0)              # Colour of hovered square.
  COL_S=Gosu::Color.rgb(0,153,0)              # Colour of selected square.

  LETTERS = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
end
