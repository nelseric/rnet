class Node
  attr_accessor :x, :y, :size, :degree

  TARGET_DISTANCE = 200

  def initialize(x, y)
    @x = x
    @y = y
    @size = 5
    @degree = 0
  end

  def draw(window)

    window.draw_quad(
        x - size, y - size, color,
        x - size, y + size, color,
        x + size, y - size, color,
        x + size, y + size, color)
  end

  def update(graph)
    graph.adjacent_vertices(self).each do |target|
      k = (Gosu.distance(x, y, target.x, target.y) / TARGET_DISTANCE) - 1

      angle = Gosu.angle(x, y, target.x, target.y)

      @x += Gosu.offset_x angle, k
      @y += Gosu.offset_y angle, k

    end
    if degree > 1
      adjacent = graph.adjacent_vertices(self)

      target_x = adjacent.map(&:x).inject(&:+) / adjacent.count

      target_y = adjacent.map(&:y).inject(&:+) / adjacent.count

      k = Gosu.distance(x, y, target_x, target_y) / 25
      angle = Gosu.angle(x, y, target_x, target_y)

      @x += Gosu.offset_x angle, k
      @y += Gosu.offset_y angle, k
    end

    if x < 0
      @x = 0
    elsif x > Gosu.screen_width
      @x = Gosu.screen_width
    end

    if y < 0
      @y = 0
    elsif y > Gosu.screen_height
      @y = Gosu.screen_height
    end
  end

  def color
    colors[degree % colors.size]
  end

  def size
    1
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


end
