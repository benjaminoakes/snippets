# Author: Benjamin Oakes <hello@benjaminoakes.com>

class ClassMethodSandbox
  def self.class_method
    puts "self: #{(self).inspect}" # => ClassMethodSandbox
  end
end

ClassMethodSandbox.class_method

