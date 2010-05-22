# Author: Benjamin Oakes <hello@benjaminoakes.com>

class AliasMapping
end

# See also: http://railstips.org/2006/11/18/class-and-instance-variables-in-ruby
module Aliasing
  def self.included(base)
    base.instance_eval do
      @alias_mapping = AliasMapping.new
    end

    base.extend(ClassMethods)
  end

  module ClassMethods
    attr_reader :alias_mapping
  end
end

# Dog = Class.new do
class Dog
  include Aliasing
end

puts Dog.alias_mapping

# puts Dog.instance_eval { @@do_dogs_bark }
# puts Dog.instance_eval { @@do_dogs_bark = true }
# 
# fido = Dog.new
# puts fido.instance_eval { @@do_dogs_bark }
# puts fido.instance_eval { @@do_dogs_bark = true }

