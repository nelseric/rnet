require "rgl/adjacency"

Hasu.load("node.rb")
Hasu.load("edge.rb")

class TangledNet
  attr_accessor :size_x, :size_y, :graph

  def initialize(size_x, size_y, num_nodes)
    @size_x = size_x
    @size_y = size_y

    @graph = RGL::AdjacencyGraph.new

    num_nodes.times do
      if @graph.vertices.count > 0
        v = @graph.vertices.sample
        @graph.add_edge v, make_node
      else
        @graph.add_edge make_node, make_node
      end
    end
    num_nodes.times

    @graph.each_vertex do |v|
      v.degree = @graph.adjacent_vertices(v).count
    end
  end

  def update
    if rand() < 0.1
      #@graph.add_edge *@graph.vertices.sample(2)
    end
    if rand() < 0.02
      @graph.add_edge @graph.vertices.sample, make_node
    end
    #if rand() < 0.005 and @graph.vertices.count > 4
    #  @graph.remove_vertex @graph.vertices.sample
    #end
    #if rand() < 0.05
    #  @graph.remove_edge *@graph.edges.sample
    #end
    @graph.each_vertex do |v|
      v.degree = @graph.adjacent_vertices(v).count
    end
    @graph.each_vertex { |v| v.update @graph }
  end

  def draw(window)

    @graph.each_edge do |a, b|
      Edge.new(a, b).draw(window)
    end

    @graph.each_vertex do |v|
      v.draw(window)
    end
  end

  private

  def make_node
    Node.new(size_x * rand(), size_y * rand)
  end

end
