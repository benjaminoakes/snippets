# Author: Benjamin Oakes <hello@benjaminoakes.com>

class Numeric
  def even?
    0 == self % 2
  end
  
  def odd?
    !even?
  end
end

(1..10).to_a.select { |number| number.even? } # => [2, 4, 6, 8, 10]

