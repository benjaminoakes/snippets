#!/usr/bin/env ruby
# Author: Benjamin Oakes <hello@benjaminoakes.com>

h = {
  'foo' => 'bar',
  'chunky' => proc { 'bacon!' },
  'baz' => 'quux',
  'spam' => proc { 'and eggs!' },
}

puts "h: #{(h).inspect}"

puts "h.to_a: #{(h.to_a).inspect}"

puts "h.to_a.sort { |l, r| l[1].class.to_s <=> r[1].class.to_s }: #{(h.to_a.sort { |l, r| l[1].class.to_s <=> r[1].class.to_s }).inspect}"

s = h.to_a.sort do |l, r|
  if Proc == l[1].class
    -1
  elsif Proc == r[1].class
    1
  else
    0
  end
end

puts "s: #{(s).inspect}"

