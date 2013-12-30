require 'gosu'
require_relative 'point'
require_relative 'default'

class Entity

  def initialize(window, image, location, velocity, is_animated=false)
    @window = window
    @window_size = window.size
    @image = image
    @location = location
    @velocity = velocity
    @acceleration = Default::Acceleration
    @turn_speed = Default::Speed
    @angle = Default::Angle
    @drag = Default::Drag
    @visible  = true
    @is_animated = is_animated
  end

  def visible?
    @visible
  end

  def warp(x, y)
    @location = Point.new( x, y )
  end

  def turn_left
    @angle -= @turn_speed
  end

  def turn_right
    @angle += @turn_speed
  end

  def accelerate
    @velocity.x += Gosu::offset_x(@angle, @acceleration)
    @velocity.y += Gosu::offset_y(@angle, @acceleration)
  end

  def move
    @location.x += @velocity.x
    @location.y += @velocity.y
    @location.x %= @window_size.x
    @location.y %= @window_size.y

    @velocity.x *= @drag
    @velocity.y *= @drag
  end

  def draw
      @image.draw_rot(@location.x, @location.y, 1, @angle)
  end

end