class Vampire
  @@vampires=[]

  attr_accessor :name, :age, :in_coffin, :drank_blood


  def initialize(name, age, in_coffin, drank_blood_today)
    @name = name
    @age = age
    @in_coffin = in_coffin
    @drank_blood = drank_blood_today
  end

  def self.create(name, age, in_coffin, drank_blood_today)
    new_vampire = Vampire.new(name, age, in_coffin, drank_blood_today)
    @@vampires << new_vampire
    return new_vampire
  end

  def self.all
    return @@vampires
  end

  def drink_blood
    @drink_blood = true
  end

  def sunrise
    if @drink_blood || @in_coffin == false
      @@vampires.delete(self)
    end
  end

  def sunset
    if @drink_blood && @in_coffin == false
    drink_blood
    puts "let's go out in search of blood"

  end

  def go_home
    @in_coffin = true
  end

end
v1=Vampire.create("Ryan", 25, false, true)
v2=Vampire.create("Gina", 30, true, false)
v3=Vampire.create("Kieth", 24, false, false)
puts Vampire.all.inspect
# puts v1.sunrise.inspect
puts v3.sunset.inspect
puts v3.go_home
puts Vampire.all.inspect
