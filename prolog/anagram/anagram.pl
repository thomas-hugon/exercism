anagram(Word, Options, Matching) :-
    findall(Option, (member(Option, Options), is_anagram(Word, Option)), Matching).


is_anagram(Reference, Word) :-
    string_lower(Reference, LowerRef),
    string_lower(Word, LowerWord),
    LowerRef \= LowerWord,
    string_chars(LowerRef, LRef), msort(LRef, LRefSorted),
    string_chars(LowerWord, LWord), msort(LWord, LWordSorted),
    LRefSorted = LWordSorted.


