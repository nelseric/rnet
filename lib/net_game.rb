require 'hasu'

Hasu.load "tangled_net.rb"
Hasu.load "node.rb"
Hasu.load "player.rb"

class NetGame < Hasu::Window
  WIDTH = 800
  HEIGHT = 600

  def initialize
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @net = TangledNet.new WIDTH, HEIGHT, 2
    @player = Player.new
  end

  def update
    @net.update
    @player.update mouse_x, mouse_y, @net.graph.vertices, button_down?(Gosu::MsRight), button_down?(Gosu::MsLeft)
  end

  def button_down(id)
    case id
      when Gosu::KbEscape
        close
    end
  end

  def draw
    @net.draw(self)
    @player.draw(self)
  end
end
