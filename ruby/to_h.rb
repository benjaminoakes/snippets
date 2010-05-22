# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'date'

class Object
  # Collect the result of the methods into a hash.
  def to_h(*methods)
    methods.inject({}) do |hash, method|
      hash[method] = send(method)
      next hash
    end
  end
end

hash = Date.today.to_h(:year, :month, :day)
puts("hash: #{hash.inspect}") # => hash: {:day=>22, :month=>5, :year=>2010}

