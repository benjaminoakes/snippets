# Take a log file of the output of `uptime` and do some statistical manipulations.
# 
# I had `uptime` append to a file every five minutes via cron for several months to get a sense of how much I actually use a given computer.
# 
# Usage: ruby analyze_load_average.rb ~/uptime_log
# Example output: 
# 
# loads.min: 0.0
# loads.max: 4.94
# average: 0.788229477735749
# standard_deviation: 0.579337023202713
# average + standard_deviation: 1.36756650093846
# average - standard_deviation: 0.208892454533036
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>
#
# (Some of the below functions are from elsewhere, but I'm not sure where anymore)

# Probably want the population to be floats.
def average(population)
  sum = population.inject(0) { |number, running_total| running_total += number }
  return sum / population.length.to_f
end

# NOTE Found the next two elsewhere

def variance(population)
  n = 0
  mean = 0.0
  s = 0.0
  population.each { |x|
    n = n + 1
    delta = x - mean
    mean = mean + (delta / n)
    s = s + delta * (x - mean)
  }
  # if you want to calculate std deviation
  # of a sample change this to "s / (n-1)"
  return s / n
end

# calculate the standard deviation of a population
# accepts: an array, the population
# returns: the standard deviation
def standard_deviation(population)
  Math.sqrt(variance(population))
end

loads = []

ARGF.each_line do |line|
  loads << line.match(/: (\d.\d\d)/)[1].to_f
end

# puts "loads: #{(loads).inspect}"

puts "loads.min: #{(loads.min).inspect}"
puts "loads.max: #{(loads.max).inspect}"

average = average(loads)
puts "average: #{(average).inspect}"

standard_deviation = standard_deviation(loads)
puts "standard_deviation: #{(standard_deviation).inspect}"

puts "average + standard_deviation: #{(average + standard_deviation).inspect}"
puts "average - standard_deviation: #{(average - standard_deviation).inspect}"

