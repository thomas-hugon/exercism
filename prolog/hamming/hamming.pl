hamming_distance(Str1, Str2, Dist) :-
    string_chars(Str1, Chars1),
    string_chars(Str2, Chars2),
    hamming_distance_chars(Chars1, Chars2, Dist).

hamming_distance_chars([], [], Dist) :- Dist is 0.
hamming_distance_chars([H1|T1], [H2|T2], Dist) :-
    hamming_distance_chars(T1, T2, D),
    ( H1 = H2 -> Dist is D ;  Dist is D + 1 ).

