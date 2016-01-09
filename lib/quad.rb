class Quad
  attr_accessor :a, :b, :c, :d

  def initialize(a, b, c, d)
    @a = a
    @b = b
    @c = c
    @d = d
  end

  def draw(window)
    window.draw_quad(
        a.x, a.y, a.color,
        b.x, b.y, b.color,
        c.x, c.y, c.color,
        d.x, d.y, d.color
    )
  end
end