real((R,_), R).
imaginary((_,I),I).

conjugate((R1, I1), (R1,I)) :- I is -I1.
abs(C, X) :-
    conjugate(C, CC),
    mul(C, CC, M),
    real(M, S),
    sqrt(S, X).

add((R1,I1),(R2,I2),(R,I)) :-
    R is R1 + R2,
    I is I1 + I2.

sub((R1,I1),(R2,I2),(R,I)) :-
    R is R1 - R2,
    I is I1 - I2.

mul((R1,I1),(R2,I2),(R,I)) :-
    R is R1 * R2 - I1 * I2,
    I is I1 * R2 + R1 * I2.
div((R1,I1),(R2,I2),(R,I)) :-
    R is (R1 * R2 + I1 * I2)/(R2*R2 + I2*I2),
    I is (I1 * R2 - R1 * I2)/(R2*R2 + I2*I2).
