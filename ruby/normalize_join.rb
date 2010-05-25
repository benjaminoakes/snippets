# Turn a unnormalized "join table" into a real join table.
# 
# Example
# -------
# 
# Input: 
# 
#     foo,1,2,3,4
#     bar,5,6,7,8,9,10
#     baz,11,12
#     quux,13,14
# 
# Output: 
# 
#     foo,1
#     foo,2
#     foo,3
#     foo,4
#     bar,5
#     bar,6
#     bar,7
#     bar,8
#     bar,9
#     bar,10
#     baz,11
#     baz,12
#     quux,13
#     quux,14
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'csv'
require 'stringio'

output = ''

CSV::Writer.generate(output) do |output_csv|
  File.open(ARGV[0]) do |input_file|
    CSV::Reader.parse(input_file) do |row|
      row[1..-1].each do |value|
        output_csv << [row[0], value]
      end
    end
  end
end

puts output

