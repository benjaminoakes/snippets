# For parsing a bunch of files I had at the time.
# 
# Depending on how many there are, it might make more sense to transform the input into a CSV using a regex and then using a spreadsheet program.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

class Element < Struct.new(:content, :count)
end

elements = []

ARGF.each_line do |line|
  split = line.split(': ')
  element = Element.new
  element.content = split[0]
  element.count = split[1].to_i
  elements << element
end

sorted = elements.sort { |l, r| r.count <=> l.count }

sorted.each do |element|
  puts "#{element.content},#{element.count}"
end

