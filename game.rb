#!/usr/bin/ruby
require "./game_board"
require "./game_view"

m, n, density = ARGV
m = m.to_i
n = n.to_i
density = density.to_i

game = GameBoard.new(m, n, density)
view = GameView.new(game)
view.draw

loop do
  STDIN.gets
  game.step
  view.draw
end
