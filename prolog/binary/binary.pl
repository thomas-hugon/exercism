binary(Str, Dec) :-
    string_chars(Str, Chars),
    chars_to_decimals_reversed(Chars, [], ReversedBinaries),
    write(ReversedBinaries),
    mul_by_twopowerindex(ReversedBinaries, Dec).

chars_to_decimals_reversed([], Acc, Acc).
chars_to_decimals_reversed([H|T], Acc, Binaries) :-
    char_code(H, C),
    (C =:= 48; C =:= 49),
    C2 is C - 48,
    chars_to_decimals_reversed(T, [C2|Acc], Binaries).

mul_by_twopowerindex(Binaries, Decimal) :- mul_by_twopowerindex(Binaries, 0, 1, Decimal).
mul_by_twopowerindex([], Decimal, _, Decimal).
mul_by_twopowerindex([H|T], Acc, Truc, Decimal) :-
    X is Acc + H * Truc,
    Y is Truc * 2,
    mul_by_twopowerindex(T, X, Y, Decimal).
