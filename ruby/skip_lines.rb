# Delete certain lines (2, 6, 10, ...).
# 
# Depending on how many files there are, I'd probably use a vim macro for this today.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

SEPARATION = 4

File.open(ARGV[0], 'r') do |file|
  count = 0
  line_to_skip = 2
  
  file.each_line do |line|
    count += 1
    if line_to_skip == count
      line_to_skip += SEPARATION
    else
      puts line
    end
  end
end

