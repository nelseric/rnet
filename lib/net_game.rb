require 'hasu'

Hasu.load "tangled_net.rb"
Hasu.load "quad_net.rb"
Hasu.load "node.rb"
Hasu.load "player.rb"

class NetGame < Hasu::Window
  WIDTH = 600
  HEIGHT = 600

  def initialize
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @size ||= 8

    @net = TangledNet.new WIDTH, HEIGHT, 30
    # @net = QuadNet.new WIDTH, HEIGHT, @size
    @player = Player.new
  end

  def update
    @net.update
    @player.update mouse_x, mouse_y, @net.graph, button_down?(Gosu::MsRight), button_down?(Gosu::MsLeft)
  end

  def button_down(id)
    case id
      when Gosu::KbEscape
        close
      when Gosu::KbUp
        @size += 1
        reset
      when Gosu::KbDown
        @size -= 1
        reset
    end
  end

  def draw
    @net.draw(self)
    @player.draw(self)
  end
end
