valid(A, B, C) :- A > 0, B > 0, C > 0, A + B > C , A + C > B , B + C > A.

triangle(A, A, A, "equilateral") :- valid(A, A, A).

isosceles(A, A, X) :- valid(A, A, X).
triangle(A, B, C, "isosceles") :- isosceles(A, B, C); isosceles(A, C, B); isosceles(B, C, A).

triangle(A, B, C, "scalene") :- triangle(A, B, C, "isosceles"), !, fail; valid(A, B, C).
