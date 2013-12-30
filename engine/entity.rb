require 'gosu'
require_relative 'point'
require_relative '../default'

class Entity

  def initialize(window, image, location, is_enabled=true, is_animated=false)
    @window = window
    @window_size = window.size
    @image = image
    @location = location
    @angle = Default::Player::Angle
    @visible  = true
    @is_animated = is_animated
    @is_enabled = is_enabled
  end

  def enabled?
    @is_enabled
  end

  def disable
    @is_enabled = false
  end

  def enable
    @is_enabled = true
  end

  def make_visible
    @is_visible = true
  end

  def make_invisible
    @is_visible = false
  end

  def visible?
    @visible
  end

  def warp(x, y)
    @location = Point.new( x, y )
  end

  def draw
      @image.draw_rot(@location.x, @location.y, 1, @angle) if visible?
  end

  def update
    enabled?
  end
end