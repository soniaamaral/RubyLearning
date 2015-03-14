require 'gosu'

class PongWindow < Gosu::Window
  def initialize
    @width = 640
    @height = 480
    super(@width, @height, false)
    self.caption = "Pong"

    @background_color = Gosu::Color.rgb(0, 0, 64)
    @paddle_color = Gosu::Color.rgb(128, 192, 255)
    @paddle_width = 16
    @paddle_height = 64
    @paddle_margin = 10
    @ball_radius = 7
    @ball_color = Gosu::Color.rgb(255, 192, 128)
  end

  def draw
    draw_rect 0, 0, @width, @height, @background_color
    draw_rect @paddle_margin, 100, @paddle_width, @paddle_height, @paddle_color
    draw_rect @width - @paddle_margin - @paddle_width, 100, @paddle_width, @paddle_height, @paddle_color
    draw_rect 321, 212, @ball_radius * 2, @ball_radius * 2, @ball_color
  end

  def draw_rect x, y, width, height, color
    draw_quad \
      x, y, color,
      x, y + height, color,
      x + width, y + height, color,
      x + width, y, color, 0
  end
end

window = PongWindow.new
window.show
