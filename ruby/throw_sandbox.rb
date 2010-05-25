# Author: Benjamin Oakes <hello@benjaminoakes.com>

puts __LINE__

catch :foo do
  puts __LINE__
  throw :foo
  puts __LINE__
end

puts __LINE__

