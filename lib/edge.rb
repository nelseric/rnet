class Edge
  attr_accessor :node_a, :node_b, :color

  def initialize(node_a, node_b, color = Gosu::Color::WHITE)
    @node_a = node_a
    @node_b = node_b
    @color = color
  end

  def draw(window)
    if node_a and node_b
      window.draw_line(
          node_a.x, node_a.y, node_a.color,
          node_b.x, node_b.y, node_b.color)
    end
  end
end