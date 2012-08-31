module Accessors
  attr_accessor :foo
end

class Bar
  include Accessors
end

b = Bar.new
b.foo = 'baz'
puts b.foo
