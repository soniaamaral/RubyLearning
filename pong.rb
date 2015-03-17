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
    @paddle_height = 92
    @paddle_margin = 10
    @ball_radius = 7
    @ball_color = Gosu::Color.rgb(255, 192, 128)
    @ball_position = Vector2d(@width / 2, @height / 2)
    @ball_abs_velocity = 300 # px/s
    @ball_velocity = Vector2d(rand(-100..100), rand(-100..100)).normalize * @ball_abs_velocity
    @paddle_velocity = 400 # px/s
    @left_paddle_position = 100
    @right_paddle_position = 100
  end

  def draw
    draw_rect 0, 0, @width, @height, @background_color
    draw_rect @paddle_margin, @left_paddle_position, @paddle_width, @paddle_height, @paddle_color
    draw_rect @width - @paddle_margin - @paddle_width, @right_paddle_position, @paddle_width, @paddle_height, @paddle_color
    draw_rect @ball_position.x - @ball_radius, @ball_position.y - @ball_radius, @ball_radius * 2, @ball_radius * 2, @ball_color
  end

  def compute_paddle_velocity kbInc, kbDec
    velocity = 0
    velocity -= @paddle_velocity if button_down? kbDec
    velocity += @paddle_velocity if button_down? kbInc
    velocity
  end

  def update
    current_left_paddle_velocity = compute_paddle_velocity(Gosu::KbS, Gosu::KbW)
    current_right_paddle_velocity = compute_paddle_velocity(Gosu::KbDown, Gosu::KbUp)

    delta = 1/60.0
    @ball_position += @ball_velocity * delta
    @left_paddle_position = [[@left_paddle_position + current_left_paddle_velocity * delta, 0].max, @height - @paddle_height].min
    @right_paddle_position = [[@right_paddle_position + current_right_paddle_velocity * delta, 0].max, @height - @paddle_height].min

    if @ball_position.y - @ball_radius < 0 and @ball_velocity.y < 0
      @ball_velocity = Vector2d(@ball_velocity.x, -@ball_velocity.y)
    end
    if @ball_position.y + @ball_radius > @height and @ball_velocity.y > 0
      @ball_velocity = Vector2d(@ball_velocity.x, -@ball_velocity.y)
    end
    if (@ball_position.x - @ball_radius < @paddle_margin + @paddle_width and @ball_position.y + @ball_radius > @left_paddle_position and @ball_position.y - @ball_radius < @left_paddle_position + @paddle_height) or
       (@ball_position.x + @ball_radius > @width - @paddle_margin - @paddle_width and @ball_position and @ball_position.y + @ball_radius > @right_paddle_position and @ball_position.y - @ball_radius < @right_paddle_position + @paddle_height)
      @ball_velocity = Vector2d(-@ball_velocity.x, @ball_velocity.y)
    end
    if @ball_position.x + @ball_radius < 0 or @ball_position.x - @ball_radius > @width
      @ball_position = Vector2d(@width / 2, @height / 2)
      @ball_velocity = Vector2d(rand(-100..100), rand(-100..100)).normalize * @ball_abs_velocity
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
