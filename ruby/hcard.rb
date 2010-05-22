# Usage:
# 
#     ruby hcard.rb < your_file.html
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>
require 'rubygems'
require 'mofo'

html = ARGF.readlines

card = hCard.find :text => html
card.properties.each do |property|
  puts "#{property}: #{card.send property}"
end
