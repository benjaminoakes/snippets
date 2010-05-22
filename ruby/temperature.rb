# Author: Benjamin Oakes <hello@benjaminoakes.com>

def fahrenheit_to_celsius(fahrenheit)
  return 5.0 * (fahrenheit - 32.0) / 9.0;
end

0.upto(300) do |fahrenheit|
  puts "#{fahrenheit} F = #{fahrenheit_to_celsius(fahrenheit)} C"
end

