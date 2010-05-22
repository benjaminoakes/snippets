# This is really cool -- you can make your own command line interface really easily, complete with autocompletion and vi input mode (if you have the latter configured in your .inputrc).
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'readline'

puts "Readline Sandbox"
puts

LIST = [
  'search', 'download', 'open',
  'help', 'history', 'quit',
  'url', 'next', 'clear',
  'prev', 'past'
].sort

puts "autocompletion for: "
puts 
puts LIST

Readline.completion_append_character = " "
Readline.completion_proc = proc { |s| LIST.grep( /^#{Regexp.escape(s)}/ ) }

while input_line = Readline.readline('> ', true)
  puts "input_line: #{(input_line).inspect}"
end

