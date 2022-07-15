:- module(problem_126, [choose/3, choose/4]).

:- use_module(library(lists)).

choose(A, N, S) :-
    choose(A, N, S, _).

choose(A, N, S, R) :-
    #N #>= 0,
    length(S, N),
    length(A, M),
    M #= N + P,
    length(R, P),
    choose(A, M, N, S, R).

choose(A, _, 0, [], A).
choose(A, M, M, A, []) :- M #> 0.
choose([A|T], M, N, [A|U], R) :-
    N #> 0,
    M #> N,
    M1 #= M - 1,
    N1 #= N - 1,
    choose(T, M1, N1, U, R).
choose([A|T], M, N, U, [A|R]) :-
    N #> 0,
    M #> N,
    M1 #= M - 1,
    choose(T, M1, N, U, R).
