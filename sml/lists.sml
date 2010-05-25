(*
 * List processing functions in SML.
 * 
 * I made these mostly to practice for an exam -- I haven't used them too heavily.
 * 
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 *)

val numList = [1, 2, 3, 4, 5, 6];
val sqrList = [1, 4, 9, 16, 25, 36];

val a2fList = ["a", "b", "c", "d", "e", "f"];
val g2lList = ["g", "h", "i", "j", "k", "l"];

val compList = [[1, 8, 27], [2], [3, 4]];
val unsorted = [123, 236, 372, 3, 23, 234, 126, 122, 123];

fun cat (list1, nil) = list1
  | cat (nil, list2) = list2
  | cat (head1 :: list1, list2) = head1 :: cat (list1, list2);

fun append x [] = [x]
  | append x (head :: tail) =
    head :: append x tail

fun insert item position [] = [item]
  | insert item 0 list = item :: list
  | insert item position (head :: tail) =
    head :: insert item (position - 1) tail

fun insertBefore insert key [] = []
  | insertBefore insert key (head :: tail) =
  if head = key
  then
    insert :: head :: insertBefore insert key tail
  else
    head :: insertBefore insert key tail;

fun remove key [] = []
  | remove key (head :: tail) =
    if head = key
    then
      tail
    else
      head :: remove key tail

fun pop item [] = (item, [])
  | pop item (head :: tail) =
    if head = item
    then
      (head, tail)
    else
      let val (found, remainder) = pop item tail
      in
        (found, head :: remainder)
      end;

fun index key [] = ~88
  | index key (head :: tail) =
    if head = key
    then
      0
    else
      1 + index key tail

fun count key [] = 0
  | count key (head :: tail) =
    if head = key
    then
      1 + count key tail
    else
      0 + count key tail

fun helpReverse (nil, nil) = nil
  | helpReverse (nil, collector) = collector
  | helpReverse (head :: tail, collector) = helpReverse (tail, head :: collector);

fun reverse list
  = helpReverse (list, nil);

fun range start stop = 
  if start > stop
  then
    nil
  else
    start :: range (start + 1) stop

fun len [] = 0
  | len (head :: tail) =
    1 + len tail

fun split [] = ([], [])
  | split [singleton] = ([singleton], [])
  | split (first :: second ::tail) =
    let val (left, right) = split tail
    in
      (first :: left, second :: right)
    end

fun slice start stop [] = []
  | slice start stop (head :: tail) =
    if start = 0 andalso start <= stop
    then
      head :: slice start (stop - 1) tail
    else
      if start > stop
      then
        []
      else
        slice (start - 1) (stop - 1) tail

fun change index value [] = []
  | change index value (head :: tail) =
    if index = 0
    then
      value :: tail
    else
      head :: change (index - 1) value tail

fun contains value [] = false
  | contains value (head :: tail) =
    if value = head
    then
      true
    else
      contains value tail

infix contains;

fun join [] = []
  | join (head :: tail) = head @ join (tail);

fun min [] = (0, [])
  | min [singleton] = (singleton, [])
  | min (head :: tail) = 
    let val (minOfTail, tailOfTail) = min tail
    in 
      if head < minOfTail
      then
        (head, tail)
      else
        (minOfTail, head :: tailOfTail)
    end

