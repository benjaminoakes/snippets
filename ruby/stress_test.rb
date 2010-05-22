# Author: Benjamin Oakes <hello@benjaminoakes.com>

class Foo
  def self.fn
    return 1000 * 1000
  end

  def self.stress_test
    starting_time = Time.now

    100_000.times do
      self.fn
    end

    return (Time.now - starting_time)
  end
end

puts Foo.stress_test

# # Version without function calls, for comparison:
# 
# starting_time = Time.now
# 
# 100_000.times do
#   1000 * 1000
# end
# 
# puts Time.now - starting_time

