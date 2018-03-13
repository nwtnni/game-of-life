class GameView

  ALIVE = :'O '
  DEAD = :'. '

  def initialize(game)
    @game = game
    @m, @n = game.size
  end

  def draw
    (0...@m).to_a.each do |i|
      puts horizontal
      (0...@n).to_a.each do |j|
        print '| '
        @game.alive?(i, j) ? print(ALIVE) : print(DEAD)
      end
      puts '|'
    end
    puts horizontal
    puts "Generations elapsed: #{@game.generations}\n"
  end

  private

  def horizontal
    ('--' * @n * 2) + '-'
  end
end
