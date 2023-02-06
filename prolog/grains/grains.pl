square(SquareNumber, Value) :- SquareNumber > 0, SquareNumber < 65, Value is 2**(SquareNumber-1).

add_square(SquareNumber, X, Value) :- square(SquareNumber, SquareValue), Value is X + SquareValue.
total(Value) :-
    findall(X, between(1,64,X),XS),
    foldl(add_square, XS, 0, Value).
