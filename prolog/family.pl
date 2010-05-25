% Family relationships.
% 
% Author: Benjamin Oakes <hello@benjaminoakes.com>

% You'll want to list some facts here, like:
% 
%     male(ben).
% 

father(Parent, Child) :- parent(Parent, Child), male(Parent).
mother(Parent, Child) :- parent(Parent, Child), female(Parent).

sibling(Child1, Child2) :- parent(Parent, Child1), parent(Parent, Child2), Child1 @< Child2.
sibling(Child1, Child2) :- parent(Parent, Child1), parent(Parent, Child2), Child2 @< Child1.

brother(Child1, Child2) :- sibling(Child1, Child2), male(Child1).
sister(Child1, Child2) :- sibling(Child1, Child2), female(Child1).

uncle(X, Y) :- brother(X, Parent), parent(Parent, Y).
aunt(X, Y) :- sister(X, Parent), parent(Parent, Y).

nephew(X, Y) :- uncle(Y, X), male(X).
nephew(X, Y) :- aunt(Y, X), male(X).

niece(X, Y) :- uncle(Y, X), female(X).
niece(X, Y) :- aunt(Y, X), female(X).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

