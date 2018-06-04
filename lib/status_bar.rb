require_relative 'constants'

class StatusBar
  include Constants

  attr_accessor :text
  def initialize(window, x = 0, y = 0, text = 'This is status bar')
    @window = window
    @text = text
    @x = x
    @y = y
  end

  def draw
    display = Gosu::Font.new(@window, Gosu.default_font_name, 25)
    display.draw(@text, @x, @y, 1.0, 1.0, 1.0, COL_N)
  end
end
