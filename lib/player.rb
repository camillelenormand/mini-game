# lib/player.rb
class Player
  attr_accessor :name, :lifepoints, :dead

  # Initialize a new player with a name and 10 lifepoints
  def initialize(name, dead = false)
    @name = name
    @lifepoints = 10
  end

  # Display the player's name and lifepoints
  def show_state
    puts "#{@name} has #{@lifepoints} points of life."
  end

  # Reduce the player's lifepoints by the amount of damage taken
  # If the player's lifepoints reach 0 or below, call the die method
  def gets_damage(damage)
    self.lifepoints -= damage
    puts
    puts "Ouch! #{self.name} took #{damage} damage and has #{self.lifepoints} health left! 😵😵😵"
    puts
    die if @lifepoints <= 0
  end

  # Attack another player
  # If the recipient is already dead, return false
  # Otherwise, compute the damage and call the gets_damage method on the recipient
  def attacks(recipient)
    if recipient.dead
      puts
      puts "#{recipient.name} is already dead! 🪦"
      puts
      return false
    end
    puts "#{self.name} has just attacked #{recipient.name} 😵‍💫😵‍💫😵‍💫!"
    damage = compute_damage
    recipient.gets_damage(damage)
  end

  # Kill the player and set the dead attribute to true
  def die()
    puts
    puts
    puts "😱😱😱 #{self.name} has been killed!! 😱😱😱"
    puts
    puts
    self.dead = true 
  end

  # Compute the amount of damage dealt by the player
  def compute_damage
    rand(1...6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  # Initialize a new human player with a name, 100 lifepoints, and a weapon level of 1
  def initialize(name, lifepoints = 100)
    super(name)
    @lifepoints = lifepoints
    @weapon_level = 1
  end

  # Display the human player's name, lifepoints, and weapon level
  def show_state
    puts "#{@name} has #{@lifepoints} points of life and a with a #{@weapon_level} level weapon."
  end

  # Compute the amount of damage dealt by the human player
  def compute_damage
    rand(1..6) * @weapon_level
  end

  # Search for a new weapon and update the weapon level if a better weapon is found
  def search_weapon
    self.weapon_level = rand(1...6)
    puts "You found a weapon with level #{@weapon_level}."
    self.weapon_level >= @weapon_level ? (puts "Great I take it!"; self.weapon_level = @weapon_level) : (puts "F@*#... it's not good enough...")
  end

  # Search for a health pack and increase the human player's lifepoints if a health pack is found
  def search_health_pack
    r = rand(1...6)
    #puts "#{r}"
    case r
    when 1 
      puts "Nothing found!"
    when 2..4
      until self.lifepoints == 100 do
        self.lifepoints += 50 
          puts "Well done! 50 point Health Pack found!"
      end
    when 6
      until self.lifepoints == 100 do
        self.lifepoints += 80
          puts "Well done! 80 point Health Pack found!"
      end
    end
  end
end
