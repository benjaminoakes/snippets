# Author: Benjamin Oakes <hello@benjaminoakes.com>

class A
end

class B < A
end

b = B.new
puts B.superclass
