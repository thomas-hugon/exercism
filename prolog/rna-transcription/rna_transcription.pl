rna_transcription(Dna, Rna) :-
    string_chars(Dna, DnaList),
    maplist(map_dna, DnaList, RnaList ),
    string_chars(Rna, RnaList).

map_dna('G', 'C').
map_dna('C', 'G').
map_dna('T', 'A').
map_dna('A', 'U').