:- module(problem_116, [drop/3]).

:- use_module(library(clpz)).

drop(A, N, R) :-
    N #> 0,
    drop(A, 1, N, R).

drop([], _, _, []).
drop([A|T], I, N, [A|R]) :-
    I #< N,
    I1 #= I + 1,
    drop(T, I1, N, R).
drop([_|T], N, N, R) :-
    drop(T, 1, N, R).
