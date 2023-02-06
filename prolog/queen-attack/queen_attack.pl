% Please visit https://exercism.io/tracks/prolog/installation
% for instructions on setting up prolog.
% Visit https://exercism.io/tracks/prolog/tests
% for help running the tests for prolog exercises.

% Replace the goal below with
% your implementation.

%! create(+DimTuple)
%
% The create/1 predicate succeeds if the DimTuple contains valid chessboard 
% dimensions, e.g. (0,0) or (2,4).
create((DimX,DimY)) :- DimX>=0 , DimY>=0 , DimX=<7 , DimY=<7.


%! attack(+FromTuple, +ToTuple)
%
% The attack/2 predicate succeeds if a queen positioned on ToTuple is 
% vulnerable to an attack by another queen positioned on FromTuple.
attack((X, _), (X, _)):- !.
attack((_, Y), (_, Y)):- !.
attack((FromX, FromY), (ToX, ToY)):- FromX - ToX =:= FromY - ToY.
attack((FromX, FromY), (ToX, ToY)):- FromX - ToX =:= ToY - FromY.
