class Window <Gosu::Window

  COL_B=Gosu::Color.rgb(255,178,102)
  
  def initialize
    super 300, 300
    self.caption = "Chess"
  end

  def needs_cursor?
    return true                   # Basic state is false.
  end

  def draw
    self.draw_quad(0,0,COL_B,
                   0,300,COL_B,
                   300,300,COL_B,
                   300,0,COL_B)
  end
end
