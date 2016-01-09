require 'geometry'

class Node
  attr_accessor :x, :y, :degree, :distance

  def initialize(x, y)
    @x = x
    @y = y
    @degree = 0
    @distance = 10
  end

  def draw(window)
    window.draw_quad(
        x - size, y - size, color,
        x - size, y + size, color,
        x + size, y - size, color,
        x + size, y + size, color)
  end

  def update(graph)

    # cur_adjacent = adjacent(graph)

    # # cur_adjacent.each do |target|
    # #   k = (Gosu.distance(x, y, target.x, target.y) - distance) / 5

    # #   angle = Gosu.angle(x, y, target.x, target.y)

    # #   @x += Gosu.offset_x angle, k
    # #   @y += Gosu.offset_y angle, k

    # # end


    # if degree >= 1r

    #   target_x = cur_adjacent.map(&:x).inject(&:+) / cur_adjacent.count

    #   target_y = cur_adjacent.map(&:y).inject(&:+) / cur_adjacent.count

    #   k = [(Gosu.distance(x, y, target_x, target_y) - 4) / 10, 0].max
      
    #   angle = Gosu.angle(x, y, target_x, target_y)

    #   if k >= 1
    #     @x += Gosu.offset_x angle, k
    #     @y += Gosu.offset_y angle, k
    #   end
    # end

  end

  def color
    Gosu::Color::BLUE
  end

  def size
    3
  end

  private

  def colors
    [Gosu::Color::WHITE,
     Gosu::Color::AQUA,
     Gosu::Color::RED,
     Gosu::Color::GREEN,
     Gosu::Color::BLUE,
     Gosu::Color::YELLOW,
     Gosu::Color::FUCHSIA,
     Gosu::Color::CYAN]
  end

  def adjacent graph
    @adjacent ||= graph.adjacent_vertices(self)
  end
end
