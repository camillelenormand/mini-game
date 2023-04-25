require 'bundler'
require 'pry'

Bundler.require
# app.rb
require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

player1 = Player.new("Josiane")
player2 = Player.new("José")
puts
puts "----- Current state of the players -----"
puts
player2.show_state
player1.show_state
puts
puts "⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️"
puts "⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️ Let's fight! ⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️"
puts "⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️"
puts
while player1.lifepoints > 0 && player2.lifepoints > 0
player1.attacks(player2)
if player2.lifepoints <= 0
  break
end
player2.attacks(player1)
if player1.lifepoints <= 0
  break 
end
end
