# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'rubygems'
require 'htmldoc'

pdf = PDF::HTMLDoc.new

pdf.set_option :outfile, "/Users/ben/outfile.pdf"
# pdf.set_option :bodycolor, :black
pdf.set_option :links, true
pdf.set_option :webpage, true

# pdf.header ".t."

pdf << "/Users/ben/Outbox/input.html"

# pdf.footer ".1."

# puts pdf.methods.sort.inspect

if pdf.generate
  puts "Successfully generated a PDF file"
else
  puts "Failure!"
end
