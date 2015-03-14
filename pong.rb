require 'gosu'

class PongWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = "Pong"
  end
end

window = PongWindow.new
window.show
