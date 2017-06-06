#!/usr/bin/ruby
require "./game_board"
require "./game_view"

unless ARGV.length == 3 then 
    puts "Usage: ruby game.rb <m> <n> <density>" 
    Kernel.exit(-1)
end

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
