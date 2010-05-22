# Author: Benjamin Oakes <hello@benjaminoakes.com>

var = :read_only

case var
when :read_only
  puts "it's read only!"
when :everything
  puts "it's everything!"
else
  raise 'reached else'
end

