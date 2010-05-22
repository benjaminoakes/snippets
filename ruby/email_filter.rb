# Extract a bunch of email addresses from text and make them into a filter for Gmail.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

text = <<END
Benjamin Oakes <hello@benjaminoakes.com>
default	edit info	
Benjamin Oakes <hello@benjaminoakes.com>
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Benjamin Oakes <hello@benjaminoakes.com>
Benjamin Oakes <hello@benjaminoakes.com>
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Benjamin Oakes <hello@benjaminoakes.com>
make default	edit info	delete
Benjamin Oakes <hello@benjaminoakes.com>
make default	edit info	delete
END

emails = []

text.gsub(/<(.*?)>/) do
  emails << $1
end

puts "(#{emails.join(" OR ")})"

