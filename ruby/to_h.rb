# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'date'

class Object
  # Collect the result of the methods into a hash.
  #
  # NOTE: Ruby 2.0 introduced using a method with the same name; be careful if using this with Ruby 2.0!
  #
  # See my blog post on to_h: http://www.benjaminoakes.com/2013/03/08/all-about-to_h-in-ruby-2/
  def to_h(*methods)
    methods.inject({}) do |hash, method|
      hash[method] = send(method)
      next hash
    end
  end
end

hash = Date.today.to_h(:year, :month, :day)
puts("hash: #{hash.inspect}") # => hash: {:day=>22, :month=>5, :year=>2010}

