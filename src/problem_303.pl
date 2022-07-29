:- module(problem_303, [table/2]).

and(A, B) :- A, B.
or(A, B) :- A; B.

bind([]).
bind([true|T]) :- bind(T).
bind([fail|T]) :- bind(T).

table(A, E) :-
    bind(A),
    try(A, E),
    fail.

try(A, E) :-
    write1(A),
    (   E ->
	write(true)
    ;   write(fail)
    ),
    nl, fail.

write1([]).
write1([A|T]) :-
    write(A), write(' '), write1(T).
