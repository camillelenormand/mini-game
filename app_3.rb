# app_3.rb
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

# Display welcome message
puts " ------------------------------------------------- "
puts "|            Welcome to the OOP game!            |"
puts "|             Be the last surviror!              |"
puts " ------------------------------------------------- "

# Prompt the user for their name
puts "Please enter your first name"
human_player = gets.chomp.to_s

# Display welcome message with user's name
puts "Welcome #{human_player}! Let's get ready to fight!"
gets.chomp

# Start a new game
my_game = Game.new(human_player, ["Player 1", "Player 2", "Player 3", "Player 4"])
gets.chomp

# Display the current state of the players
my_game.show_players
gets.chomp

# Start the game
puts "⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️ Let's fight! ⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️"
puts
gets.chomp

# Prompt the user for menu choice
my_game.menu_choice(gets.chomp.downcase)
gets.chomp


# Bots attack the user
my_game.enemies_attack
gets.chomp


# End message
my_game.end_game