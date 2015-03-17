require 'gosu'
require 'vector2d'

class Ball
  attr_reader :radius
  attr_accessor :position, :velocity

  def initialize radius
    @radius = radius
  end
end

class VerticalLineSegment
  attr_reader :length, :x
  attr_accessor :y_min

  def initialize x, y_min, length
    @x, @y_min, @length = x, y_min, length
  end

  def y_max
    @y_min + @length
  end
end

class PongWindow < Gosu::Window
  def initialize
    @width = 640
    @height = 480
    super(@width, @height, false)
    self.caption = "Pong"

    @background_color = Gosu::Color.rgb(0, 0, 64)
    @paddle_color = Gosu::Color.rgb(128, 192, 255)
    @paddle_width = 16
    paddle_height = 92
    paddle_margin = 10
    @ball = Ball.new(7)
    @ball_color = Gosu::Color.rgb(255, 192, 128)
    @ball.position = Vector2d(@width / 2, @height / 2)
    @ball_abs_velocity = 300 # px/s
    @ball.velocity = Vector2d(rand(-100..100), rand(-100..100)).normalize * @ball_abs_velocity
    @paddle_velocity = 400 # px/s

    @left_paddle = VerticalLineSegment.new(paddle_margin + @paddle_width, 100, paddle_height)
    @right_paddle = VerticalLineSegment.new(@width - paddle_margin - @paddle_width, 100, paddle_height)
  end

  def draw
    draw_rect 0, 0, @width, @height, @background_color
    draw_rect @left_paddle.x - @paddle_width, @left_paddle.y_min, @paddle_width, @left_paddle.length, @paddle_color
    draw_rect @right_paddle.x, @right_paddle.y_min, @paddle_width, @right_paddle.length, @paddle_color
    draw_rect @ball.position.x - @ball.radius, @ball.position.y - @ball.radius, @ball.radius * 2, @ball.radius * 2, @ball_color
  end

  def compute_paddle_velocity kbInc, kbDec
    velocity = 0
    velocity -= @paddle_velocity if button_down? kbDec
    velocity += @paddle_velocity if button_down? kbInc
    velocity
  end

  def bounce_ball_right_off_segment paddle, ball
    if ball.position.x - ball.radius < paddle.x and
       ball.position.y + ball.radius > paddle.y_min and
       ball.position.y - ball.radius < paddle.y_max and
       ball.velocity.x < 0
      return Vector2d(-ball.velocity.x, ball.velocity.y)
    end
    ball.velocity
  end

  def bounce_ball_left_off_segment paddle, ball
    if ball.position.x + ball.radius > paddle.x and
       ball.position.y + ball.radius > paddle.y_min and
       ball.position.y - ball.radius < paddle.y_max and
       ball.velocity.x > 0
      return Vector2d(-ball.velocity.x, ball.velocity.y)
    end
    ball.velocity
  end

  def update
    current_left_paddle_velocity = compute_paddle_velocity(Gosu::KbS, Gosu::KbW)
    current_right_paddle_velocity = compute_paddle_velocity(Gosu::KbDown, Gosu::KbUp)

    delta = 1/60.0
    @ball.position += @ball.velocity * delta
    @left_paddle.y_min = [[@left_paddle.y_min + current_left_paddle_velocity * delta, 0].max, @height - @left_paddle.length].min
    @right_paddle.y_min = [[@right_paddle.y_min + current_right_paddle_velocity * delta, 0].max, @height - @right_paddle.length].min

    if @ball.position.y - @ball.radius < 0 and @ball.velocity.y < 0
      @ball.velocity = Vector2d(@ball.velocity.x, -@ball.velocity.y)
    end
    if @ball.position.y + @ball.radius > @height and @ball.velocity.y > 0
      @ball.velocity = Vector2d(@ball.velocity.x, -@ball.velocity.y)
    end

    @ball.velocity = bounce_ball_right_off_segment(@left_paddle, @ball)
    @ball.velocity = bounce_ball_left_off_segment(@right_paddle, @ball)

    if @ball.position.x + @ball.radius < 0 or @ball.position.x - @ball.radius > @width
      @ball.position = Vector2d(@width / 2, @height / 2)
      @ball.velocity = Vector2d(rand(-100..100), rand(-100..100)).normalize * @ball_abs_velocity
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
