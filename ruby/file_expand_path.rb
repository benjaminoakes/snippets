# Author: Benjamin Oakes <hello@benjaminoakes.com>

puts File.expand_path('', __FILE__)
puts File.expand_path('.', __FILE__)

puts File.expand_path('..', __FILE__)
puts File.dirname(File.expand_path(__FILE__))

