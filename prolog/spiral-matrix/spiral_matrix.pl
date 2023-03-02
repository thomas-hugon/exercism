start(dir(1, 0), -1, 0, 0).
next(dir(1, 0),dir(0, 1)).
next(dir(0, 1),dir(-1, 0)).
next(dir(-1, 0),dir(0, -1)).
next(dir(0, -1),dir(1, 0)).

spiral(0, []) :- !.
spiral(NB, Lines) :-
    square_array(NB, Lines),
    start(StartDir, StartX, StartY, StartValue),
    next(StartDir, NextDir),
    NB2 is NB -1,
    % write line 1
    place_nb_values(StartDir, StartX, StartY, NextX, NextY, StartValue, NextValue, NB, Lines),
    % write rest
    spiral0( NextDir, NextX, NextY, NextValue, NB2, Lines), !.

square_array(NB, Lines) :-
    length(Lines, NB),
    lists_length(NB, Lines), !.

lists_length(_, []).
lists_length(NB, [L|Ls]) :-
    length(L, NB),
    lists_length(NB, Ls).

spiral0(_, _, _, _, 0, _) :- !.
spiral0(Dir, X, Y, Value, NB, Lines) :-
    place_nb_values(Dir, X, Y, NextX, NextY, Value, NextValue, NB, Lines),
    next(Dir, NextDir),
    place_nb_values(NextDir, NextX, NextY, RecurX, RecurY, NextValue, RecurV, NB, Lines),
    next(NextDir, RecurDir),
    RecurNB is NB-1,
    spiral0(RecurDir, RecurX, RecurY, RecurV, RecurNB, Lines).


place_value(X,Y,V,Lines) :-
   nth0(Y, Lines, Line),
   nth0(X, Line, V).

place_nb_values(_, X, Y, X, Y, V, V, 0, _) :- !.
place_nb_values(dir(DX, DY), X, Y, NX, NY, V, NV, NB, Lines) :-
    NB1 is NB - 1,
    V1 is V + 1,
    X1 is X + DX,
    Y1 is Y + DY,
    place_value(X1, Y1, V1, Lines),
    place_nb_values(dir(DX, DY), X1, Y1, NX, NY, V1, NV, NB1, Lines).


