class Player

  attr_accessor :x, :y, :active, :target

  def initialize
    @on = false
    @tgt = nil
  end

  def update x, y, vertices, push, pull
    @x = x
    @y = y

    @active = push || pull

    recalculate_target vertices unless push

    if (push || pull) && target
      angle = Gosu.angle(x, y, target.x, target.y)
      k = Gosu.distance(x, y, target.x, target.y) / 10

      if push
        target.x += Gosu.offset_x angle, k
        target.y += Gosu.offset_y angle, k
      elsif pull
        target.x -= Gosu.offset_x angle, k
        target.y -= Gosu.offset_y angle, k
      end
    end

  end

  def draw(window)
    if target
      window.draw_line(target.x, target.y, tgt_color, @x, @y, Gosu::Color::RED)
    else
      window.draw_line(0, 0, tgt_color, @x, @y, Gosu::Color::RED)
    end
  end

  def recalculate_target(vertices)
    dist_map = {}
    vertices.each do |v|
      dist_map[Gosu.distance(self.x, self.y, v.x, v.y)] = v
    end

    @target = dist_map[dist_map.keys.min]
  end

  def tgt_color
    if active
      Gosu::Color::GREEN
    else
      Gosu::Color::BLACK
    end
  end

end