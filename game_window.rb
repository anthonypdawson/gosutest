require 'gosu'
require_relative 'starship'
require_relative 'engine/point'
require_relative 'engine/entity'
require_relative 'engine/player'
require_relative 'ZOrder'
require_relative 'star'

class GameWindow < Gosu::Window
  attr_reader :size, :star_anim
  attr_accessor :stars

  def initialize (size)
    super size.x, size.y, false
    @size = size
    self.caption = "Gosu game"

    @background_image = Gosu::Image.new(self, "img/Space.png", true)

    @player = Starship.new(self)
    @player.warp(size.x / 2, size.y / 2)

    @star_anim = Gosu::Image::load_tiles(self, "img/Star.png", 25, 25, false)
    @stars = Array.new

    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.turn_left
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.turn_right
    end
    if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      @player.accelerate
    end
    if button_down? Gosu::KbDown or button_down? Gosu::GpButton1 then
      @player.deccelerate
    end
    if button_down? Gosu::KbSpace or button_down? Gosu::Gp3Button2 then
      #@player.shoot
    end
    @player.move
    @player.collect_stars(@stars)

    if rand(100) < 4 and @stars.size < 25 then
      @stars.push(Star.new(@star_anim, self))
    end
  end

  def draw
    @background_image.draw(0,0,ZOrder::Background)
    @player.draw
    @stars.each { |star| star.draw }
    @font.draw("Score: #{@player.score}  #{@player.debug}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end

window = GameWindow.new(Point.new(1080, 720))
window.show
