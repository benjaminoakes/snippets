# Same as the C code, essentially.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

class Mammal
end

class Cat < Mammal
  def speak
    puts "Miaow!"
  end
end

class Dog < Mammal
  def speak
    puts "Woof!"
  end
end

junior = Dog.new
butterscotch = Cat.new

junior.speak
butterscotch.speak

