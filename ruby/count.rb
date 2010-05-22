# Author: Benjamin Oakes <hello@benjaminoakes.com>

# A potentially better way would be:
# 
#   counts = Hash.new { 1 }
# 
# Then you can just call
# 
#   counts[item] += 1
# 
# regardless of initialization.  (No more if/else!)
counts = {}

ARGF.each_line do |line|
  items = line.chomp.split(',')
  items.each do |item|
    if counts[item]
      counts[item] += 1
    else
      counts[item] = 1
    end
  end
end

counts.each do |item, count|
  puts "#{item}: #{count}"
end

