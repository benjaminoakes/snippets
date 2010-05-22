# Metaprogramming.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

class Foo
  def bar
    @chunky = "bacon"
  end
  
  def inspect
    puts instance_variables.inspect
  end
end

my_foo = Foo.new
my_foo.bar
my_foo.inspect

