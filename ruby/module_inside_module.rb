# Author: Benjamin Oakes <hello@benjaminoakes.com>

module Inside
  def inside_method
    return 'inside'
  end
end

module Outside
  include Inside

  def outside_method
    return 'outside'
  end
end

class SomeClass
  include Outside
end

sc = SomeClass.new
puts sc.inside_method
puts sc.outside_method

