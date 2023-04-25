require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

puts " ------------------------------------------------- "
puts "|            Welcome to the OOP game!            |"
puts "|             Be the last surviror!              |"
puts " ------------------------------------------------- "

puts "Please enter your first name"
user_name = gets.chomp().to_s
puts "Welcome #{user_name} ! Let's ready to fight!"
gets.chomp()
user = HumanPlayer.new(user_name)
bot1 = Player.new("Josiane")
bot2 = Player.new("José")
enemies = [bot1, bot2]
puts
puts "----- Current state of the players -----"
puts
user.show_state
bot1.show_state
bot2.show_state
puts
puts "⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️"
puts "⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️ Let's fight! ⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️"
puts "⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️"
puts
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
        user.search_weapon
    when "s"
        user.search_health_pack
    when "0"
      user.attacks(bot1)
      if bot1.lifepoints <= 0
        break
      end
    when "1"
      user.attacks(bot2)
      if bot2.lifepoints <= 0
        break
      end
    else
      puts "Invalid input. Please try again."
      gets.chomp()
  end
  gets.chomp()
  puts "Bots are now attacking!! 🤖🤖"
  gets.chomp()
  enemies.each do | bot |  
    if bot.lifepoints <= 0
      break
    end
    bot.attacks(user)
  end
  gets.chomp()
  user.show_state
  bot1.show_state
  bot2.show_state
  gets.chomp()
end
puts 
user.lifepoints > 0 ? (puts "----------- YOU WON----------- 😎😎😎") : (puts "----------- GAME OVER ----------- 😥😥😥")
