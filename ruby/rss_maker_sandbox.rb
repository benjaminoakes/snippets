# Based on example code from http://rubyrss.com/.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'rss/maker'

version = "2.0" # ["0.9", "1.0", "2.0"]
destination = "maker_output.xml" # local file to write

content = RSS::Maker.make(version) do |m|
  m.channel.title = "Example Ruby RSS feed"
  m.channel.link = "http://www.rubyrss.com"
  m.channel.description = "Old news (or new olds) at Ruby RSS"
  m.items.do_sort = true # sort items by date
    
  i = m.items.new_item
  i.title = "Ruby can parse RSS feeds"
  i.link = "http://www.rubyrss.com/"
  i.date = Time.parse("2007/2/11 14:01")
  
  i = m.items.new_item
  i.title = "Ruby can create RSS feeds"
  i.link = "http://www.rubyrss.com/"
  i.date = Time.now

  # # Maker doesn't seem to support enclosure...
  # i.enclosure = 'https://www.pbk.org/userfiles/file/Key%20Reporter/TKR%201%202010(1).pdf'
end

File.open(destination,"w") do |f|
  f.write(content)
end

