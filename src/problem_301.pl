:- module(problem_301, [table/3]).

and(A, B) :- A, B.
or(A, B) :- A; B.

bind(true).
bind(fail).

table(A, B, Expression) :-
    bind(A),
    bind(B),
    try(A, B, Expression),
    fail.

try(A, B, Expression) :-
    write(A), write(' '), write(B), write(' '),
    (   Expression ->
        write(true)
    ;   write(fail)
    ),
    nl, fail.

