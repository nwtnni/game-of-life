class GameBoard
  @@delta = [[-1, -1], [-1, 0], [-1, 1],
             [0, -1], [0, 1],
             [1, -1], [1, 0], [1, 1]]

  def initialize(m, n, density)
    @m = m
    @n = n
    @board = Array.new(@m) { Array.new(@n) }
    @board.each { |row| row.map! { rand(density).zero? ? true : false } }
  end

  def step
    @board.each_index do |i|
      @board[i].each_index do |j|
        @board[i][j] = transition(i, j)
      end
    end
  end

  def size
    [@m, @n]
  end

  def alive?(i, j)
    @board[i][j] if in_bounds?(i, j)
  end

  private

  def transition(i, j)
    if @board[i][j]
      neighbors(i, j).between?(2, 3) ? true : false
    else
      neighbors(i, j) == 3
    end
  end

  def neighbors(i, j)
    @@delta.reduce(0) do |sum, adj|
      d_i, d_j = adj
      adj_i = i + d_i
      adj_j = j + d_j
      if in_bounds?(adj_i, adj_j)
        sum + 1 if @board[adj_i][adj_j]
      end
      sum
    end
  end

  def in_bounds?(i, j)
    (i >= 0 && i < @m) && (j >= 0 && j < @n)
  end
end
