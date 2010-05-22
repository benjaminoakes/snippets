# Author: Benjamin Oakes <hello@benjaminoakes.com>

ARGF.each_line do |line|
  if Kernel.rand < 0.1
    puts line
  end
end

