require_relative 'actor'

class Projectile < Actor
  attr_reader :entity, :max_travel, :speed, :ttl, :fired

  def initialize(entity, max_travel=Default::Projectile::MaxDistance, speed=Default::Projectile::Speed, ttl=Default::Projectile::TTL)
    @entity = entity
    @counter = 0;
    @max_travel = max_travel
    @speed = speed
    @ttl = ttl
    @fired = false
  end

  def fire
    @fired = true
    @entity.make_visible
  end

  def draw
    super if fired
  end

  def update
    super if !super
    if fired
      super
      @entity.update
      @entity.draw
      @counter += 1
      if @counter > @ttl
        disable
      end
    end
  end

end