# Author: Benjamin Oakes <hello@benjaminoakes.com>

class Foo
  def []=(key, value, quux)
    puts "key: #{(key).inspect}"
    puts "value: #{(value).inspect}"
    puts "quux: #{(quux).inspect}"
  end
end

f = Foo.new
f['a', 'b'] = 1


