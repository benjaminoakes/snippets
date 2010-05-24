# Use 'readline' for the MATLAB command line.
# 
# Motivation: I really wished MATLAB would use readline for its command line (so that I could use the vi input mode).  Because of that input mode, readline makes it a breeze to try out ideas in other languages (e.g., via irb, sqlite3, python, mysql, etc.) -- but not MATLAB.  I thought it would be interesting to try to make a wrapper around the MATLAB CLI.
# 
# NOTE This code kinda-sorta works, but needs a lot of work to make it usable.
# 
# If you're intrigued by the vi input mode stuff, try putting this in your ~/.inputrc:
# 
#     set editing-mode vi 
#     set keymap vi
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

# See also: http://bogojoker.com/readline/
require 'readline'

io = IO.popen('matlab -nosplash -nodesktop 2>&1', 'w+')

# until (output_line = io.gets).match(/For product information/)
while first_char = io.getc
  if first_char.chr == '>'
    # clear the line
    io.puts('')
    break
  end

  entire_line = first_char.chr + io.gets
  puts entire_line
end

puts "got out #{__LINE__}"

# while input_line = Readline.readline('>> ', true)
#   io.puts input_line
# 
#   until (output_line = io.gets).match(/>> /)
#     puts "io.gets: #{(io.gets).inspect}"
#   end
# end


puts "line: #{__LINE__}"
while input_line = Readline.readline('>> ', true)
  puts "line: #{__LINE__}"
  # puts "input_line: #{(input_line).inspect}"
  puts "line: #{__LINE__}"
  io.puts input_line
  puts "line: #{__LINE__}"
  
  puts "line: #{__LINE__}"
  while first_char = io.getc
    puts "line: #{__LINE__}"
    # puts "first_char.chr: #{(first_char.chr).inspect}"
    puts "line: #{__LINE__}"
    if '>' == first_char.chr
      puts "line: #{__LINE__}"
      io.puts('')
      puts "line: #{__LINE__}"
      # break
    end
    puts "line: #{__LINE__}"

    puts "line: #{__LINE__}"
    entire_line = first_char.chr + io.gets
    puts "line: #{__LINE__}"
    puts entire_line
    puts "line: #{__LINE__}"
  end

  puts "got out #{__LINE__}"
end

puts "got out #{__LINE__}"

