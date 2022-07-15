:- module(problem_126, [choose/3]).

:- use_module(library(lists)).

choose(A, N, S) :-
    #N #>= 0,
    length(S, N),
    length(A, M),
    M #>= N,
    choose(A, M, N, S).

choose(_, _, 0, []).
choose(A, M, M, A) :- M #> 0.
choose([A|T], M, N, [A|U]) :-
    N #> 0,
    M #> N,
    M1 #= M - 1,
    N1 #= N - 1,
    choose(T, M1, N1, U).
choose([_|T], M, N, U) :-
    N #> 0,
    M #> N,
    M1 #= M - 1,
    choose(T, M1, N, U).
