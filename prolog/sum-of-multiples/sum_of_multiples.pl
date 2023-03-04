sum_of_multiples(_, 0, 0) :- !.
sum_of_multiples(Factors, Limit, Sum) :-
    multiples(Factors, Limit, Multiples), !,
    sum(Multiples, Sum).

sum([], 0) :- !.
sum([H|T], Sum) :-
    sum(T, X),
    Sum is H + X.

multiples(_, 1, []).
multiples(Factors, Limit, [X|Multiples]) :-
    X is Limit - 1,
    multiple(Factors, X), !,
    multiples(Factors, X, Multiples).
multiples(Factors, Limit, Multiples) :-
    X is Limit - 1,
    multiples(Factors, X, Multiples), !.

multiple([H|_], X) :- X mod H =:= 0, !.
multiple([_|T], X) :- multiple(T, X).