# Author: Benjamin Oakes <hello@benjaminoakes.com>

(1..10).to_a.each do |item|
  puts item
end

as_strings = (1..10).to_a.map do |number|
  "##{number.to_s}"
end

puts("as_strings: #{as_strings.inspect}")

