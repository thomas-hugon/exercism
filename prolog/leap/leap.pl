leap(X) :-
    divmod(X, 4, _, 0),
    (\+ divmod(X, 100, _, 0) ; divmod(X, 400, _, 0) ), !.
