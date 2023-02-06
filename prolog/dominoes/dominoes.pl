can_chain([]) :- !.
can_chain([(X,X)]) :- !.
can_chain(Pieces) :-
    select((P11, P12), Pieces, Rest),
    (select((P12, P2), Rest, Rest2); select((P2, P12), Rest, Rest2) ),
    can_chain([(P11,P2)|Rest2]),!.

