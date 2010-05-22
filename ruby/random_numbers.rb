# Author: Benjamin Oakes <hello@benjaminoakes.com>

random_list = (1..100).to_a.collect do
	(rand * 100).to_i
end

puts random_list.inspect
puts random_list.sort.inspect
