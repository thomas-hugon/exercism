isogram(String) :-
    string_chars(String, Chars),
    lowercase(Chars, Lower),
    unique(Lower).

lowercase(Chars, Lower) :-
    lowercase(Chars, [], LowerRev),
    reverse(LowerRev, Lower).

lowercase([], Acc, Acc).
lowercase([H|T], Acc, Lower) :-
    char_code(H, C),
    ( C >= 65, C =< 90
    -> NewC is C + 32
    ;  NewC = C
    ),
    char_code(NewH, NewC),
    lowercase(T, [NewH|Acc], Lower).


not_member(Char, Chars) :- Char = '-'; Char = ' '; not(member(Char, Chars)).

unique([]).
unique([T|H]) :- not_member(T, H), unique(H).

