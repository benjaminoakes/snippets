# Author: Benjamin Oakes <hello@benjaminoakes.com>

print "radius? "
radius = gets.to_f

circumference = 2 * Math::PI * radius
area = Math::PI * radius ** 2
volume = (4 * Math::PI / 3) * radius ** 3
puts "volume: #{volume}"

