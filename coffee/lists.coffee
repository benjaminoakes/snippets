# Recursive list functions
# 
# After finding out that CoffeeScript has some pattern matching, I started playing around with converting code I originally wrote in SML to CoffeeScript.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>
rlist = do ->
  module = {}

  # Construct a list from a head and tail
  # 
  # The same as head :: tail in SML, it returns the combined list.
  module.cons = cons = (head, list) ->
    list.unshift(head)
    list

  # Append to a list.
  # 
  # Original SML:
  # 
  #   fun append x [] = [x]
  #     | append x (head :: tail) =
  #       head :: append x tail
  module.append = append = (x, list) ->
    [head, tail...] = list

    if !head
      [x]
    else
      cons head, append(x, tail)

  # Insert an item at the position.
  # 
  # Original SML:
  # 
  #   fun insert item position [] = [item]
  #     | insert item 0 list = item :: list
  #     | insert item position (head :: tail) =
  #       head :: insert item (position - 1) tail
  module.insert = insert = (item, position, list) ->
    [head, tail...] = list

    if !head
      [item]
    else if position == 0
      cons item, list
    else
      cons head, insert item, (position - 1), tail

  # Insert the item before the given key.
  # 
  # Original SML:
  # 
  #   fun insertBefore insert key [] = []
  #     | insertBefore insert key (head :: tail) =
  #     if head = key
  #     then
  #       insert :: head :: insertBefore insert key tail
  #     else
  #       head :: insertBefore insert key tail;
  module.insertBefore = insertBefore = (item, key, list) ->
    [head, tail...] = list

    if !head
      []
    else if head == key
      cons item, cons head, insertBefore item, key, tail
    else
      cons head, insertBefore item, key, tail

  # Remove a key from the list.
  # 
  # Original SML:
  # 
  #   fun remove key [] = []
  #     | remove key (head :: tail) =
  #       if head = key
  #       then
  #         tail
  #       else
  #         head :: remove key tail
  module.remove = remove = (key, list) ->
    [head, tail...] = list

    if !head
      []
    else if head == key
      tail
    else
      cons head, remove key, tail

  # Find the index of the given key.
  # 
  # Original SML:
  # 
  #   fun index key [] = ~88
  #     | index key (head :: tail) =
  #       if head = key
  #       then
  #         0
  #       else
  #         1 + index key tail
  module.index = index = (key, list) ->
    [head, tail...] = list

    if !head
      undefined
    else if head == key
      0
    else
      1 + index key, tail

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
  module.count = count = (key, list) ->
    [head, tail...] = list
    
    if !head
      0
    else if head == key
      1 + count key, tail
    else
      0 + count key, tail

  # Reverse a list.
  # 
  # Original SML:
  # 
  #   fun helpReverse (nil, nil) = nil
  #     | helpReverse (nil, collector) = collector
  #     | helpReverse (head :: tail, collector) = helpReverse (tail, head :: collector);
  # 
  #   fun reverse list
  #     = helpReverse (list, nil);
  module.reverse = (list) ->
    helper = (list, collector) ->
      [head, tail...] = list

      if !head
        collector
      else
        helper tail, cons head, collector

    helper(list, [])

  # Generate a range of numbers.
  # 
  # Original SML:
  # 
  #   fun range start stop = 
  #     if start > stop
  #     then
  #       nil
  #     else
  #       start :: range (start + 1) stop
  module.range = range = (start, stop) ->
    if start > stop
      []
    else
      cons start, range start + 1, stop

  # Length of a list
  # 
  # Original SML:
  # 
  #   fun len [] = 0
  #     | len (head :: tail) =
  #       1 + len tail
  # 
  module.len = len = (list) ->
    [head, tail...] = list
  
    if !head
      0
    else
      1 + len tail

  # 
  # 
  # Original SML:
  # 
  #   fun slice start stop [] = []
  #     | slice start stop (head :: tail) =
  #       if start = 0 andalso start <= stop
  #       then
  #         head :: slice start (stop - 1) tail
  #       else
  #         if start > stop
  #         then
  #           []
  #         else
  #           slice (start - 1) (stop - 1) tail
  module.slice = slice = (start, stop, list) ->
    [head, tail...] = list

    if !head
      []
    else if start == 0 and start <= stop
      cons head, slice start, stop - 1, tail
    else if start > stop
      []
    else
      slice start - 1, stop - 1, tail

  # Change the value at the index to another value.
  # 
  # Original SML:
  # 
  #   fun change index value [] = []
  #     | change index value (head :: tail) =
  #       if index = 0
  #       then
  #         value :: tail
  #       else
  #         head :: change (index - 1) value tail
  module.change = change = (index, value, list) ->
    [head, tail...] = list

    if !head
      []
    else if index == 0
      cons value, tail
    else
      cons head, change index - 1, value, tail

  # Does the list contain a value?
  # 
  # Original SML:
  # 
  #   fun contains value [] = false
  #     | contains value (head :: tail) =
  #       if value = head
  #       then
  #         true
  #       else
  #         contains value tail
  module.contains = contains = (value, list) ->
    [head, tail...] = list

    if !head
      false
    else if head == value
      true
    else
      contains value, tail

  # Join a list with a string.
  # 
  # Original SML:
  # 
  #   fun join [] = []
  #     | join (head :: tail) = head @ join (tail);
  module.join = join = (list, s) ->
    [head, tail...] = list
    
    if !head
      []
    else
      head + s + join tail, s

  # TODO
  # 
  # Original SML:
  # 
  #   fun pop item [] = (item, [])
  #     | pop item (head :: tail) =
  #       if head = item
  #       then
  #         (head, tail)
  #       else
  #         let val (found, remainder) = pop item tail
  #         in
  #           (found, head :: remainder)
  #         end;

  # Split a list.
  # 
  # TODO
  # 
  # Original SML:
  # 
  #   fun split [] = ([], [])
  #     | split [singleton] = ([singleton], [])
  #     | split (first :: second ::tail) =
  #       let val (left, right) = split tail
  #       in
  #         (first :: left, second :: right)
  #       end

  # Minimum element in the list.
  # 
  # TODO
  # 
  # Original SML:
  # 
  #   fun min [] = (0, [])
  #     | min [singleton] = (singleton, [])
  #     | min (head :: tail) = 
  #       let val (minOfTail, tailOfTail) = min tail
  #       in 
  #         if head < minOfTail
  #         then
  #           (head, tail)
  #         else
  #           (minOfTail, head :: tailOfTail)
  #       end

  # Concatenate lists.
  # 
  # TODO
  # 
  # Original SML:
  # 
  #   fun cat (list1, nil) = list1
  #     | cat (nil, list2) = list2
  #     | cat (head1 :: list1, list2) = head1 :: cat (list1, list2);

  module

# I didn't have standalone Jasmine handy when writing this without an internet connection :(

# console.log rlist.append(4, [1, 2, 3]) # => [1, 2, 3, 4]
# console.log rlist.insert(1, 3, [1, 2, 3, 4]) # => [1, 2, 3, 1, 4]
# console.log rlist.insertBefore(1, 3, [1, 2, 3, 4]) # => [1, 2, 1, 3, 4]
# console.log rlist.remove(2, [1, 2, 3, 4]) # => [1, 3, 4]
# console.log rlist.reverse([1, 2, 3, 4]) # => [4, 3, 2, 1]
# console.log rlist.range(1, 5) # => [1, 2, 3, 4, 5]
# console.log rlist.join([1, 2, 3], ',') # => "1,2,3,"
# console.log rlist.contains(3, [1, 2, 3]) # => true
# console.log rlist.contains(4, [1, 2, 3]) # => false
# console.log rlist.change(1, 5, [1, 2, 3]) # => [1, 5, 3]
# console.log rlist.slice(2, 4, [1, 2, 3, 4, 5, 6, 7]) # => [3, 4, 5]
# console.log 'rlist.len([1, 2, 3]): ' + rlist.len([1, 2, 3]) # => 3
# console.log 'rlist.len([1, 2, 3, 4, 5]): ' + rlist.len([1, 2, 3, 4, 5]) # => 5
# console.log 'rlist.count(1, [1, 2, 3, 1]): ' + rlist.count(1, [1, 2, 3, 1]) # => 2
# console.log 'rlist.count(2, [1, 2, 3, 1]): ' + rlist.count(2, [1, 2, 3, 1]) # => 1
