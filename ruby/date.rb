# I always thought it was silly that Date didn't have a method like this.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'date'

class Date
  # Get the month name for this date object
  def month_name
    MONTHNAMES[self.month]
  end
end

puts Date.today.month_name
