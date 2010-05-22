# Author: Benjamin Oakes <hello@benjaminoakes.com>

class String
  def wrap(column = 80)
    return self.gsub(/(.{1,#{column}})(\s+|$)\n?|(.{#{column}})/, "\\1\\3\n")
  end
end

puts 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'.wrap

# Wraps to 80 characters:
# 
#   Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
#   incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
#   nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
#   Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
#   fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
#   culpa qui officia deserunt mollit anim id est laborum.

