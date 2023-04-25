require 'bundler'
require 'pry'

Bundler.require
# Require all the gems in the Gemfile

require_relative 'lib/game'
require_relative 'lib/player'

# Create two new players
player1 = Player.new("Josiane")
player2 = Player.new("José")

# Display the current state of the players
puts "----- Current state of the players -----"
puts
player2.show_state
player1.show_state
puts

# Start the fight
puts "⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️"
puts "⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️ Let's fight! ⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️"
puts "⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️"
puts

# Start the loop until one of the players has no more lifepoints
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
