nucleotide_count( Str, [('A', A),('C', C),('G', G),('T', T)]) :-
    string_chars(Str, Chars),
    nucleotide_count2(Chars, F1),
    selectchk(('A',A), F1, F2),
    selectchk(('C',C), F2, F3),
    selectchk(('G',G), F3, F4),
    selectchk(('T',T), F4, []).

nucleotide_count2( [], [('A', 0),('C', 0),('G', 0),('T', 0)]).
nucleotide_count2( [X|XS], Freqs) :-
    nucleotide_count2(XS, Freqs2),
    selectchk((X,N), Freqs2, Rest),
    M is N + 1,
    append([(X, M)], Rest, Freqs).