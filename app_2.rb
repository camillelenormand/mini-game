# app_2.rb
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Display welcome message
puts " ------------------------------------------------- "
puts "|            Welcome to the OOP game!            |"
puts "|             Be the last surviror!              |"
puts " ------------------------------------------------- "

# Prompt the user for their name
puts "Please enter your first name"
user_name = gets.chomp().to_s

# Display welcome message with user's name
puts "Welcome #{user_name} ! Let's get ready to fight!"
gets.chomp()

# Create user and bots
user = HumanPlayer.new(user_name)
bot1 = Player.new("Josiane")
bot2 = Player.new("José")
enemies = [bot1, bot2]

# Display the current state of the players
puts
puts "----- Current state of the players -----"
puts
user.show_state
bot1.show_state
bot2.show_state
puts

# Start the game
puts "⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️ Let's fight! ⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️"
puts

# Loop until the game ends
while bot1.lifepoints > 0 && (bot2.lifepoints > 0 || user.lifepoints > 0) do
  # Prompt the user for input
  puts "Enter your choice"
  puts
  puts "a. Look for a better weapon"
  puts "s. Recover"
  puts
  puts "Attack a player"
  puts
  print "0 - " 
  bot1.show_state
  print "1 - "
  bot2.show_state
  puts
  user_choice = gets.chomp.downcase
  case user_choice
    when "a"
        # User searches for a better weapon
        user.search_weapon
    when "s"
        # User recovers health
        user.search_health_pack
    when "0"
      # User attacks bot1
      user.attacks(bot1)
      if bot1.lifepoints <= 0
        break
      end
    when "1"
      # User attacks bot2
      user.attacks(bot2)
      if bot2.lifepoints <= 0
        break
      end
    else
      # Invalid input
      puts "Invalid input. Please try again."
      gets.chomp()
  end
  gets.chomp()
  # Bots attack the user
  puts "Bots are now attacking!! 🤖🤖"
  gets.chomp()
  enemies.each do | bot |  
    if bot.lifepoints <= 0
      break
    end
    bot.attacks(user)
  end
  gets.chomp()
  # Display the current state of the players
  user.show_state
  bot1.show_state
  bot2.show_state
  gets.chomp()
end

# Display the result of the game
puts 
user.lifepoints > 0 ? (puts "----------- YOU WON----------- 😎😎😎") : (puts "----------- GAME OVER ----------- 😥😥😥")