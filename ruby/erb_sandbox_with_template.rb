# Read an ERB template and spit out the result.
# 
# Example usage:
# 
#     ruby erb_sandbox_with_template.rb erb_sandbox.html.erb 
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>
require "erb"

template = ARGF.readlines
template_shell = ERB.new(template, 0, '%<>')
output = template_shell.result
puts output

