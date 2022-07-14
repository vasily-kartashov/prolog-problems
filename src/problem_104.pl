:- module(problem_104, [list_length/2]).

:- use_module(library(clpz)).

list_length(L, N) :-
    #N #>= 0,
    list_length(L, 0, N).

list_length([], N, N).
list_length([_|T], I, N) :-
    I #< N,
    I1 #= I + 1,
    list_length(T, I1, N).
