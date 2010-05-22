# Inject demo, basically.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

grand_total = [3.99, 9.99, 4.49, 3.99].inject(0) do |running_total, price|
  running_total += price
end

puts("grand_total: #{grand_total.inspect}")

