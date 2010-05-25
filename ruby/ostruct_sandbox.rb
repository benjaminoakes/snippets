# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'ostruct'

# Like a hash, but acts more like a Struct.
record = OpenStruct.new

record.foo = 'bar'
record.bar = 'baz'
record.baz = 'quux'
record.quux = '...'

puts "record: #{(record).inspect}"

