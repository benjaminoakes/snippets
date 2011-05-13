# After finding out that CoffeeScript has some pattern matching, I started playing around with converting code I originally wrote in SML to CoffeeScript.
# 
# All the SML code is at ../sml/lists.sml in this same repository.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

# Length of a list
# 
# Original SML:
# 
#   fun len [] = 0
#     | len (head :: tail) =
#       1 + len tail
# 
length = (list) ->
  [head, tail...] = list

  if !head
    0
  else
    1 + length tail

# Count occurrences of a key in a list
# 
# Original SML:
# 
#   fun count key [] = 0
#     | count key (head :: tail) =
#       if head = key
#       then
#         1 + count key tail
#       else
#         0 + count key tail
# 
count = (key, list) ->
  [head, tail...] = list
  
  if !head
    0
  else if head == key
    1 + count key, tail
  else
    0 + count key, tail

console.log length([1, 2, 3])
console.log length([1, 2, 3, 4, 5])
console.log count(1, [1, 2, 3, 1])
console.log count(2, [1, 2, 3, 1])
