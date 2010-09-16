# For something like `Foo()`
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

class Foo;end
def Foo; Foo.new; end
puts "Foo(): #{(Foo()).inspect}" # => #<Foo:0xb72abf04>

