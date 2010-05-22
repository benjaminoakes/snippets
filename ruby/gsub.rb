# Author: Benjamin Oakes <hello@benjaminoakes.com>

string = "HELLO world".gsub(/[a-z]+/i) do |match|
  if match.match(/^[A-Z]+$/)
    match
  else
    match.capitalize
  end
end

puts("string: #{string.inspect}") # => string: "HELLO World" 

