# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'csv'

left = []

File.open('left.csv') do |left_file|
  first = true
  CSV::Reader.parse(left_file) do |row|
    unless first
      left << row[0]
    else
      first = false
    end
  end
end

# puts "left"
# puts left

right = []

File.open('right.csv') do |right_file|
  first = true
  CSV::Reader.parse(right_file) do |row|
    unless first
      right << row[row.length - 1]
    else
      first = false
    end
  end
end

# puts "right"
# puts right

diff = left.reject { |id| right.member?(id) }

puts diff

