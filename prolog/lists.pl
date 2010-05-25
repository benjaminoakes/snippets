% List processing functions in Prolog.
% 
% I made these mostly to practice for an exam -- I haven't used them too heavily.
% 
% Author: Benjamin Oakes <hello@benjaminoakes.com>

% Basis: If an item is the head (the first item), it's in the list.
member(Item, [Item|_]).
% If an item is the head of the tail (or any of the tail's tails), it's in the list.
member(Item, [_|Tail]) :- member(Item, Tail).

% Basis: The empty list is a subset of all lists.
subset([], _).
% If the head of the list and the heads of all the tails are members of the set, it is a subset.
subset([Head|Tail], Set) :- member(Head, Set),  subset(Tail, Set).

% Basis: the union of any list with the empty list is that list.
union([], List, List).
% If the head of the list is already in the other list, don't stick it on the front.
union([Head|Tail], List, Output) :- member(Head, List), union(Tail, List, Output).
% IF the head *isn't* in the second list, put it in the output of the function.
union([Head|Tail], List, [Head|Output]) :- union(Tail, List, Output).

% Basis: An empty set's intersection with any other set is the empty set.
intersect([], _, []).
% If the head is a member of the other set, append it to the output.  Continue on with the tail, until the basis is hit.
intersect([Head|Tail], List, [Head|Output]) :- member(Head, List), intersect(Tail, List, Output).
% This is the "else" part; move on to the next element of the list if it wasn't a member.
intersect([_|Tail], List, Output) :- intersect(Tail, List, Output).

% Definition: A - B = {x: x <- A and x </- B}
% Basis: [] - B  = []
diff([], _, []).
% If the head (x) of A is in A and in B, don't append it to the output.
diff([Head|Tail], List, Output) :- member(Head, List), diff(Tail, List, Output).
% If the head (x) of A is in A and *not* in B, *append* it to the output.
% This is reached by a guard condition.
diff([Head|Tail], List, [Head|Output]) :- diff(Tail, List, Output).

% Basis: an empty list is a prefix of a list.
prefix([], List).
% Remove and match elements from the possible prefix until we get down to nothing in the first slot,  meaning that it's a prefix.
prefix([Head|Tail], [Head|Remainder]) :- prefix(Tail, Remainder).

% Basis: A list is a suffix of itself.
suffix(List, List).
% Remove elements until a matching suffix part is reached.  That is, if [i,n,g] is the suffix:
% 
% [w,a,l,k,i,n,g]
% [a,l,k,i,n,g]
% [l,k,i,n,g]
% [k,i,n,g]
% [i,n,g]
% MATCH!
suffix(Suffix, [Head|Tail]) :- suffix(Suffix, Tail).

% Basis: a prefix of a list is a sublist of that list as well.
sublist(Sublist, List) :- prefix(Sublist, List).
% Reduce the part of the list we're searching until either we've found the sublist or the list is empty. 
sublist(Sublist, [Head|Tail]) :- sublist(Sublist, Tail).

% Basis: Taking zero elements gives an empty list.
take(0, _, []).
% Reduce the number until the basis of 0 is hit.  Append the head to the output as this goes along.
take(Number, [Head|Tail], [Head|Output]) :- Number > 0, Remaining is Number - 1, take(Remaining, Tail, Output).

% Basis: Dropping zero elements gives just the given list.
drop(0, List, List).
% Take off the front of the list and call drop until we hit the basis.
drop(Number, [_|Tail], Output) :- Number > 0, Remaining is Number - 1, drop(Remaining, Tail, Output).

% Basis: The zeroth element is at he head.
nth(0, [Head|_], Head).
% Inductive step: Reduce the list until the item at Position is reached, or fail.
nth(Position, [_|Tail], Output) :- Position > 0, Remaining is Position - 1, nth(Remaining, Tail, Output).

% Basis: Substituting anything in an empty list gives an empty list.
substitute(_, _, [], []).
% If the item we're looking for is at the beginning of the list, throw it away and put the substitution in its place.
substitute(Key, Substitution, [Head|Tail], [Substitution|Output]) :- Key = Head, substitute(Key, Substitution, Tail, Output).
% We reach this point if we didn't find what we were looking for at the beginning.  Put the item back and move on to the next one.
substitute(Key, Substitution, [Head|Tail], [Head|Output]) :- substitute(Key, Substitution, Tail, Output).

% Use drop and take to get the halves.
spliteven(List, Left, Right) :- length(List, Length), Half is Length // 2, take(Half, List, Left), drop(Half, List, Right).

% Basis: an empty list doesn't have duplicates.
nodups([], []).
% Take out the first duplicates, because its easier to test for those.
% If the head of the list is in the tail, it is a duplicate!  Don't add it to the output.
nodups([Head|Tail], Output) :- member(Head, Tail), nodups(Tail, Output).
% If the head isn't a member, go ahead and stick it to the output.
nodups([Head|Tail], [Head|Output]) :- nodups(Tail, Output).

% For a while I was trying to do a simple [Head|Tail] operation in the non-atomic case.
% We need to define a utility function to make this work:
concat([], List, List). 
concat([Head|Tail], List, [Head|Middle]) :- concat(Tail, List, Middle).  

% Flattening an empty list gives the empty list.
flatten([], []).
% If the head is atomic, stick it to the output.
flatten([Head|Tail], [Head|Output]) :- atomic(Head), flatten(Tail, Output).
% Flatten the head (since it's not atomic) and continue on with the tail.  Concatenate the two together.
flatten([Head|Tail], Output) :- flatten(Head, Out1), flatten(Tail, Out2), concat(Out1, Out2, Output).

remove(Key, [], []).
remove(Key, [Key|Tail], Output) :- remove(Key, Tail, Output).
remove(Key, [Head|Tail], [Head|Output]) :- remove(Key, Tail, Output).

interval(Start, Stop, []) :- Start > Stop.
interval(Start, Stop, [Start|Output]) :- NewStart is Start + 1, interval(NewStart, Stop, Output).

dupl([], []).
dupl([Head|Tail], [Head,Head|Output]) :- dupl(Tail, Output).

rotate(0, List, []).
rotate(Number, [], []) :- Number > 0.
rotate(Number, [Head|Tail], Output) :- Number > 0, NewNumber is Number - 1, concat(Tail, [Head], NewList), rotate(NewNumber, NewList, Output).

% I think `reverse` is a built-in predicate in some versions of Prolog...
myReverse([], []).
myReverse([Singleton], [Singleton]).
myReverse([Head|Tail], Output) :- concat(Tail, Head, NewList), myReverse(NewList, Output).

% FIXME
insert(0, Item, List, [Item|List]).
insert(Number, Item, [Head|Tail], [Head|Output]) :- Number > 0, NewNumber is Number - 1, insert(NewNumber, Item, Tail, Output).

get(0, [Head|Tail], Head).
get(Number, [Head|Tail], Output) :- Number > 0, NewNumber is Number - 1, get(NewNumber, Tail, Output).

count(_, [], 0).
count(Key, [Key|Tail], Output) :- Output is O2 + 1, count(Key, Tail, O2).
count(Key, [_|Tail], Output) :- count(Key, Tail, Output).

contains(Key, [Key|_]).
contains(Key, [_|Tail]) :- contains(Key, Tail).

length([], 0).
length([H|T],N) :- length(T, M), N is M + 1.

