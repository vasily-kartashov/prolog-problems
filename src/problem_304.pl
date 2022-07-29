:- module(problem_304, [gray/2]).

gray(N, C) :-
    #N #> 0,
    gray1(N, C).

gray1(0, []).
gray1(N, [B|T]) :-
    0 #< N,
    N1 #= N - 1,
    bit(B),
    gray1(N1, T).

bit(0).
bit(1).
