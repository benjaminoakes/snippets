# Author: Benjamin Oakes <hello@benjaminoakes.com>

printer = Proc.new do |element|
  puts element
end

[1, 2, 3, 4].each &printer
