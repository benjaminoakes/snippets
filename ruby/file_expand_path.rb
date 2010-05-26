# For $LOAD_PATH.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

# # No
# puts File.expand_path('', __FILE__)
# puts File.expand_path('.', __FILE__)

# # Yes
puts File.expand_path('..', __FILE__)
puts File.dirname(File.expand_path(__FILE__))

