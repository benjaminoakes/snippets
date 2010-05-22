# Incomplete.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

class Foo
  has_bars :quuxes
  
  # ...
end

# ---

module ClassMethods
  def has_bars(name)
    define_method name do
      # code
    end
    
    define_method "#{name}=" do |value|
      # code
    end
  end
end

