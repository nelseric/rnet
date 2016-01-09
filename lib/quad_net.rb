Hasu.load "node.rb"
Hasu.load "edge.rb"
Hasu.load "quad.rb"
class QuadNet
  attr_accessor :size_x, :size_y, :graph, :n, :grid

  def initialize(size_x, size_y, n)
    @size_x = size_x
    
    @size_y = size_y

    @n = n

    @graph = RGL::AdjacencyGraph.new

    space_x = size_x / (n+1)
    space_y = size_y / (n+1)

    @grid = []

    (1..n).each do |row_n|
      row = []
      (1..n).each do |col_n|
        node = Node.new(space_x * col_n, space_y * row_n)
        graph.add_vertex node
        row << node
      end
      row.each_cons(2) do |a, b|
        a = a.first if a.kind_of? Set
        b = b.first if b.kind_of? Set
        graph.add_edge a, b
      end
      @grid << row
    end
    @grid.each_with_index do |row, row_index|
      if row_index > 0
        parent = @grid[row_index-1]
        row.each_with_index do |col, col_index|
          graph.add_edge col, parent[col_index]
        end
      end
    end
  end

  def update
    @graph.each_vertex do |v|
      v.degree = @graph.adjacent_vertices(v).count
    end
    @graph.each_vertex { |v| v.update @graph }
  end

  def draw(window)

    (0...n-1).each do |row|
      (0...n-1).each do |col|
        a=grid[row][col]
        b=grid[row][col+1]
        c=grid[row+1][col+1]
        d=grid[row+1][col]
        binding.pry unless [a, b, c, d].all?
        Quad.new(a, b, c, d).draw(window)
      end
    end

    graph.each_edge do |a, b|
      Edge.new(a, b).draw(window)
    end
  end
end