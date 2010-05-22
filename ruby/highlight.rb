# Author: Benjamin Oakes <hello@benjaminoakes.com>

class String
  def highlight(term)
    self.gsub(term) do |match|
      "<span class='highlight'>#{match}</span>"
      # Or the new HTML5 element:  "<mark>#{match}</mark>"
    end
  end
end

puts "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.".highlight(/in/i) # => Lorem ipsum dolor sit amet, consectetur adipisic<span class='highlight'>in</span>g elit, sed do eiusmod tempor <span class='highlight'>in</span>cididunt ut labore et dolore magna aliqua. Ut enim ad m<span class='highlight'>in</span>im veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor <span class='highlight'>in</span> reprehenderit <span class='highlight'>in</span> voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur s<span class='highlight'>in</span>t occaecat cupidatat non proident, sunt <span class='highlight'>in</span> culpa qui officia deserunt mollit anim id est laborum.

