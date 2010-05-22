# Author: Benjamin Oakes <hello@benjaminoakes.com>

hours = %w[8 8 8 8 8 8 8 8]

hours.each do |hour|
  hour = hour.to_f
  puts "hour: #{hour.inspect}"
  puts "20%: #{hour * 0.20}"
  puts "80%: #{hour * 0.80}"
  puts
end
