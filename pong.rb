require 'gosu'
require 'vector2d'

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
    @ball_position = Vector2d(@width / 2, @height / 2)
    @ball_abs_velocity = 500 # px/s
    @ball_velocity = Vector2d(rand(-100..100), rand(-100..100)).normalize * @ball_abs_velocity
  end

  def draw
    draw_rect 0, 0, @width, @height, @background_color
    draw_rect @paddle_margin, 100, @paddle_width, @paddle_height, @paddle_color
    draw_rect @width - @paddle_margin - @paddle_width, 100, @paddle_width, @paddle_height, @paddle_color
    draw_rect @ball_position.x - @ball_radius, @ball_position.y - @ball_radius, @ball_radius * 2, @ball_radius * 2, @ball_color
  end

  def update
    current_time = Gosu::milliseconds
    if not @last_time.nil?
      delta = (current_time - @last_time) / 1000.0
      @ball_position += @ball_velocity * delta
    end
    @last_time = current_time

    if @ball_position.y - @ball_radius < 0 or @ball_position.y + @ball_radius > @height
      @ball_velocity = Vector2d(@ball_velocity.x, -@ball_velocity.y)
    end
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
