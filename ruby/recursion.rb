# Author: Benjamin Oakes <hello@benjaminoakes.com>

def fibonacci(n, step)
  puts ('   ' * step) + "calling fibonacci with #{n}"
  if n == 0
    return 0
  elsif n == 1
    return 1
  else
    return fibonacci(n - 1, step + 1) + fibonacci(n - 2, step + 1)
  end
end

def recursive_find_in_array(haystack, needle)
  first = haystack.pop
  if [] == haystack
    return false
  elsif needle == first
    return true
  else
    recursive_find_in_array(haystack, needle)
  end
end

puts "recursive_find_in_array([1, 2, 3, 4], 3): #{(recursive_find_in_array([1, 2, 3, 4], 3)).inspect}"
puts "recursive_find_in_array([1, 2, 3, 4], 5): #{(recursive_find_in_array([1, 2, 3, 4], 5)).inspect}"


0.upto(5) do |n|
  puts '-' * 20
  puts "out: #{fibonacci(n, 0)}"
end

