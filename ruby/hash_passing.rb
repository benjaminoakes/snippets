# Author: Benjamin Oakes <hello@benjaminoakes.com>

def take_a_hash(hash)
  puts hash.inspect
end

# Works
take_a_hash(:foo => "bar")

# Works
take_a_hash({:foo => "bar"})

# Works
take_a_hash(
  :foo => "bar"
)

# Works
take_a_hash({
  :foo => "bar"
})

# DOESN'T WORK
# take_a_hash {
#   :foo => "bar"
# }

