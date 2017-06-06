class GameBoard

  @@delta = [-1, 0, 1]

  def initialize(m, n, density)
    @m = m
    @n = n
    @board = Array.new(@m) { Array.new(@n) }
    @board.each { |row| row.map! { rand(density).zero? ? true : false } }
  end

  def step
    @board.each_index do |i|
      row.each_index do |j|
        @board = transition(i, j)
      end
    end
  end

  def transition(i, j) 
    if @board[i][j]
      neighbors(i, j).between?(2, 3) ? true : false
    else
      neighbors(i, j) == 3
    end
  end

  def neighbors(i, j)

  end

  def in_bounds?(i, j)
    (i >= 0 && i < @m) && (j >= 0 && j < @n)
  end
end
