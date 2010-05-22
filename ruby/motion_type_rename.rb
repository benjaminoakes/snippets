# Author: Benjamin Oakes <hello@benjaminoakes.com>

ARGF.each_line do |line|
  line.chomp!
  match_data = line.match(/(.)(.)_(.)(.)/)
  new = [1, 3, 2, 4].map { |i| match_data[i] }.join

  puts "  '#{line}' => '#{new[0, 2]}_#{new[2, 2]}',"
end

