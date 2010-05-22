# Author: Benjamin Oakes <hello@benjaminoakes.com>

def generate(klass, function_symbol, range, step_size)
  values = []

  n = range.begin

  while n <= range.end
    values << klass.send(function_symbol, n)
    n += step_size
  end

  return values
end

puts generate(Math, :sin, 1..10, 0.1)

