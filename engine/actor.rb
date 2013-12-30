require_relative 'entity'
class Actor < Entity

  def initialize(window, image, location, velocity, is_animated=false)
    super(window, image, location, is_animated)
    @velocity = velocity
    @drag = Default::World::Drag
    @acceleration = Default::Acceleration
    @max_velocity = Default::Speed
    @turn_speed = Default::TurnSpeed
  end

  def turn_left
    @angle -= @turn_speed
  end

  def turn_right
    @angle += @turn_speed
  end

  def accelerate(restrict_speed=false)
    @velocity.x += Gosu::offset_x(@angle, @acceleration)
    @velocity.y += Gosu::offset_y(@angle, @acceleration)

    if restrict_speed
      @velocity.x = @max_velocity if @velocity.x > @max_velocity
      @velocity.x = (@max_velocity * -1) if @velocity.x < (-1 * @max_velocity)
      @velocity.y = @max_velocity if @velocity.y > @max_velocity
      @velocity.y = (@max_velocity * -1) if @velocity.y < (-1 * @max_velocity)
    end
  end

  def deccelerate
    @velocity.x -= Gosu::offset_x(@angle, @acceleration)
    @velocity.y -= Gosu::offset_y(@angle, @acceleration)
  end

  def max_speed_x?
    (@velocity.x + Gosu::offset_x(@angle, @acceleration)) > @max_velocity
  end

  def max_speed_y?
    (@velocity.y + Gosu::offset_y(@angle, @acceleration)) > @max_velocity
  end

  def move
    @location.x += @velocity.x
    @location.y += @velocity.y
    @location.x %= @window_size.x
    @location.y %= @window_size.y

    @velocity.x *= @drag
    @velocity.y *= @drag
  end

end