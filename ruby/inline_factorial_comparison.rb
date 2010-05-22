# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'rubygems'
require 'inline'

class MyTest
  def factorial(n)
    f = 1
    n.downto(2) { |x| f *= x }
    f
  end

  inline do |builder|
    builder.c %{ 
      long factorial_c(int max) {
        int i=max;
        long result=1;
        while (i >= 2) { result *= i--; }
        return result;
      }
    }
  end
end

test = MyTest.new

1.upto(30) do |n|
  r = test.factorial(n)
  c = test.factorial_c(n)
  if r != c
    puts n
  end
end

