:- module(problem_104, [length/2]).

:- use_module(library(clpz)).

length(L, N) :-
    #N #>= 0,
    length(L, 0, N).

length([], N, N).
length([_|T], I, N) :-
    I #< N,
    I1 #= I + 1,
    length(T, I1, N).
