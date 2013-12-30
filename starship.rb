require_relative 'engine/player'
require_relative 'engine/projectile'

class Starship < Player

  def initialize(window)
    super(window,
          Gosu::Image.new(window, 'img/Starfighter.bmp', false),
          Point.new(0.0, 0.0),
          Point.new(0.0, 0.0))

    @beep = Gosu::Sample.new(window, 'sound/Beep.wav')
    @ammo = []
  end

  def score
    @ammo.size
  end

  def shoot
    star = @ammo.pop
    @window.stars.push star
  end

  def collect_stars(stars)
    if stars.reject! { |star| Gosu::distance(@location.x, @location.y, star.x, star.y) < 35 } then
      @ammo << Projectile.new(Star.new(@window.star_anim, @window), 500, 10, 60 * 600)
      @beep.play
      true
    else
      false
    end
  end

  def debug
    "x=#{@velocity.x} y=#{@velocity.y}"
  end
end