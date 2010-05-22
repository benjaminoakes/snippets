# Extract contents of an HTML tag from a web page.
# 
# Example usage:
# 
#     ruby extract_tag_content.rb strong "http://www.benjaminoakes.com/"
#     ruby extract_tag_content.rb em "http://www.benjaminoakes.com/"
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'open-uri'

require 'rubygems'
require 'hpricot'

tag = ARGV[0]
url = ARGV[1]

page = open(url)
parsed = Hpricot.parse(page)

contents = []

parsed.search(tag) do |e|
  contents << e.inner_html
end

puts contents

