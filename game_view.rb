class GameView

  ALIVE = :'O '
  DEAD = :'. '

  def initialize(game)
    @game = game
    @m, @n = game.size
  end

  def draw
    (0...@m).to_a.each do |i|
      (0...@n).to_a.each do |j|
        @game.alive?(i, j) ? print(ALIVE) : print(DEAD)
      end
      puts ""
    end
    puts "Generations elapsed: #{@game.generations}\n"
  end

  private
end
