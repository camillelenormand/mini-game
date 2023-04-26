require_relative 'player'

class Game < Player
  attr_accessor :human_player, :enemies, :lifepoints, :dead
  
  def initialize(human_player, enemies)
    super(lifepoints, dead)
    @human_player = human_player
    @enemies = enemies
  end

  def is_still_ongoing?
    lifepoints > 0 && !enemies.empty?
  end

  def show_players(human_player, enemies)
    human_player.show_state
    enemies.size
  end

  def kill_player
    enemies.delete_at()
  end

  def menu
    puts "Enter your choice"
    puts
    puts "a. Look for a better weapon"
    puts "s. Recover"
    puts
    puts "Attack a player"
    puts
    enemies.each_with_index do |enemy, index|
      puts "#{index} - #{enemy.show_state}"
    end
    puts
    user_choice = gets.chomp.downcase
    menu_choice(user_choice)
  end

  def menu_choice(user_choice)
    while !enemies.empty? && enemies.any?(&:alive?) && human_player.alive? do
      case user_choice
      when "a"
        human_player.search_weapon
      when "s"
        human_player.search_health_pack
      when "0".."3"
        enemy = enemies[user_choice.to_i]
        human_player.attacks(enemy)
        enemies.delete_at(user_choice.to_i) if enemy.dead?
      else
        puts "Invalid input. Please try again."
        user_choice = gets.chomp().downcase
      end
    end
    enemies_attack
    end_game
  end
  

  def enemies_attack
    puts "Bots are now attacking!! 🤖🤖"
    enemies.each do |enemy|  
      enemy.attacks(human_player) if enemy.alive?
    end
  end

  def end_game
    human_player.alive? ? puts("----------- YOU WON----------- 😎😎😎") : puts("----------- GAME OVER ----------- 😥😥😥")
  end
end