# Author: Benjamin Oakes <hello@benjaminoakes.com>

class MyClass
  def self.test(&block)
    a = nil
    b = nil

    puts "a: #{(a).inspect}"
    puts "b: #{(b).inspect}"

    yield a, b

    puts "a: #{(a).inspect}"
    puts "b: #{(b).inspect}"
  end
end

MyClass.test { |p1, p2| p1 = Proc.new { 1 }; p2 = Proc.new { 2 } }

