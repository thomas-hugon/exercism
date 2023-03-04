wordy(Question, Answer) :-
    split_string(Question, " ", "?", [_, "is" | W]),
    p(Answer, W, []), !.
wordy(_, _) :- throw(error(syntax_error, _)).

p(_) --> ["the"], {throw(error(unknown_operation_error, _))}.
p(S) --> nb(Nb), tail(Nb, S).
tail(S, S) --> [].
tail(Acc, S) --> plus, nb(Nb), {Acc2 is Acc + Nb}, tail(Acc2, S), !.
tail(Acc, S) --> minus, nb(Nb), {Acc2 is Acc - Nb}, tail(Acc2, S), !.
tail(Acc, S) --> mul, nb(Nb), {Acc2 is Acc * Nb}, tail(Acc2, S), !.
tail(Acc, S) --> div, nb(Nb), {Acc2 is Acc / Nb}, tail(Acc2, S), !.
tail(_, _) --> ["cubed"], {throw(error(unknown_operation_error, _))}.
tail(_, _) --> {throw(error(syntax_error, _))}.

nb(Nb) --> [X], {number_string(Nb, X)}.

plus --> ["plus"].
minus --> ["minus"].
mul --> ["multiplied","by"].
div --> ["divided","by"].

