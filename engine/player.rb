
require 'gosu'
require_relative 'actor'
require_relative 'point'
class Player < Actor

  def initialize(window, image, location, is_animated=false)
    super(window, image, location, Point.new(0,0), is_animated)
    @max_velocity = Default::Player::Speed
    @acceleration = Default::Player::Acceleration
    @turn_speed = Default::Player::TurnSpeed
  end


end
