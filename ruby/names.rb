# Author: Benjamin Oakes <hello@benjaminoakes.com>

name = "John Doe"
puts("name: #{name.inspect}")

regex = /([A-Z][a-z]*)\s+?([A-Z][A-Za-z]*)/

name.match(regex)
first_name = $1
last_name = $2
puts("first_name: #{first_name.inspect}")
puts("last_name: #{last_name.inspect}")

