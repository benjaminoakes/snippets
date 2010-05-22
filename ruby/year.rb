# Random future dates.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'date'

31.times do
  puts((Date.today + (365 * 11 * rand)) + (365 * 7))
end

