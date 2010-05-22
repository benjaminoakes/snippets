# Author: Benjamin Oakes <hello@benjaminoakes.com>

class A
  def foo
    puts "foo"
  end
end

a = A.new
a.foo

class B < A
  Asdf = 'asdfsa'
  
  A.class_eval do
    def bar
      puts "bar"
    end
  end
end

a.bar
puts B::Asdf

