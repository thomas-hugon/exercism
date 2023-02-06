pascal(N, Lines) :- p_lines(N, Inv), reverse(Inv, Lines).

p_lines(0, []) :- !.
p_lines(1, [[1]]) :- !.
p_lines(X, [L1,L2|LS]) :-
    X1 is X - 1,
    p_lines(X1, [L2|LS]),
    row_part([0|L2], L1).

row_part([1], [1]) :- !.
row_part([PR1, PR2|PRS], [NR1|NRS]) :-
    NR1 is PR1 + PR2,
    row_part([PR2|PRS], NRS).
