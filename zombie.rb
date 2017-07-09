class Zombie

  attr_accessor :speed, :strength

  @@horde=[]
  @@speed_list=[]
  @@plague_level = 10
  #wont change it
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(speed, strength)
    @speed = speed
    @strength = strength
    if @speed > @@max_speed
      @speed = @@default_speed
      return @speed
    end
    if @strength > @@max_strength
      @strength = @@default_strength
      return @strength
    end

  end

  def encounter
    outrn_zombie?
    survive_attack?

    if outrn_zombie? && survive_attack?
      puts "You got away"
    elsif  outrn_zombie? == false && survive_attack? == true
      puts "You died"
    elsif outrn_zombie? == true && survive_attack? == false
      puts "you are now a zombie"
    else
      puts "you are zombie family!!"
    end
  end

  def outrn_zombie?

      if self.speed < rand(@@max_speed)
      return true
      else
      false
      end

  end

  def survive_attack?

      if self.strength < rand(@@max_strength)
      return true
      else
      false
      end

  end

  def self.all
    return @@horde
  end

  def self.new_day
    Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plague_level
  end

  def self.some_die_off
    rand(0..10).times do
    @@horde.pop
    end
    return @@horde
  end

  def self.spawn
    @@plague_level.times do
      number_of_zombies = Zombie.new(rand(10), rand(16))
      @@horde << number_of_zombies
    end
    return @@horde
    # 2.times do
    # number_of_zombies = rand(@@plague_level+1)
    # @@horde << number_of_zombies
    # end
    # Zombie.new(rand(@@max_speed + 1), rand(@@max_strength+1))
  end

  def self.increase_plague_level
    @@plague_level += rand(0..2)
  end

  def self.deadliest_zombie
    @@horde.each do |speed_info|
      @@speed_list << speed_info.speed
    end
    @@speed_list.max

  end

end

puts Zombie.all.inspect
Zombie.new_day
puts Zombie.all.inspect
z1=Zombie.all[0]
z2=Zombie.all[1]
z3=Zombie.all[2]
puts z1.encounter
puts z2.encounter
puts z3.encounter
puts Zombie.deadliest_zombie
