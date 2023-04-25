class Player
  attr_accessor :name, :lifepoints, :dead

  def initialize(name)
    @name = name
    @lifepoints = 10
  end

  def show_state
    puts "#{@name} has #{@lifepoints} points of life."
  end

  def gets_damage(damage)
    self.lifepoints -= damage
    puts
    puts "Ouch! #{self.name} took #{damage} damage and has #{self.lifepoints} health left! 😵😵😵"
    puts
    die if @lifepoints <= 0
  end

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

  def die()
    puts
    puts "☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️"
    puts
    puts "😱😱😱 #{self.name} has been killed!! 😱😱😱"
    puts
    puts "☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️"
    puts
    self.dead = true 
  end

  def compute_damage
    rand(1...6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level
  def initialize(name)
    super(name)
    @lifepoints = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} has #{@lifepoints} points of life and a with a #{@weapon_level} level weapon."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    self.weapon_level = rand(1...6)
    puts "You found a weapon with level #{@weapon_level}."
    self.weapon_level >= @weapon_level ? (puts "Great I take it!"; self.weapon_level = @weapon_level) : (puts "F@*#... it's not good enough...")
  end

  def search_health_pack
    r = rand(1...6)
    case r
    when 1 
      puts "Nothing found!"
    when 2..4
      until self.lifepoints == 100 do self.lifepoints += 50 
      puts "Well done! 50 point Health Pack found!"
      end
    when 6
      until self.lifepoints == 100 do self.lifepoints += 80
      puts "Well done! 80 point Health Pack found!"
      end
    end
  end
end
