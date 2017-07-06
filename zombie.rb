class Zombie
  @@horde=[]
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
    end
    if @strength <= @@max_strength
      @strength = @@default_strength
    end
  end

  def encounter

  end

  def outrn_zombie?

  end

  def survive_attack?

  end

  def self.all
    return @@horde
  end

  def self.new_day

  end

  def self.some_die_off

  end

  def self.spawn
    2.times do
    number_of_zombies = rand(@@plague_level+1)
    @@horde << number_of_zombies
    end
    Zombie.new(@@horde[0], @@horde[1])
  end

  def self.increase_plague_level

  end

end
