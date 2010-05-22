# Calculate change (as in currency)
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

class ChangeMachine
  def self.make_change(amount)
    amount = (amount * 100).round
    # puts amount
    used = []

    @denominations.each do |denomination|
      while denomination <= amount
        used << denomination / 100.0
        amount -= denomination
      end
    end

    return used
  end
  
private
  @denominations = [100_00, 50_00, 20_00, 10_00, 5_00, 1_00, 25, 10, 5, 1]
end

amount = rand(19999) / 100.0
# amount = 187.69 # FIXME doesn't work (?)
puts amount

total = 0

ChangeMachine::make_change(amount).each do |money|
  puts money
  total += money
  puts "total: #{total}"
end

puts "#{total} == #{amount} (#{total == amount})"

# if total.equal?(amount)
#   puts "good"
# else
#   puts "bad"
# end

