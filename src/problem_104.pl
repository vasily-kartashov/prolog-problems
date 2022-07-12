:- module(problem_104, [list_length/2]).

:- use_module(library(clpz)).

list_length([], 0).
list_length([_|T], N) :- 
    N #> 0,
    N #= N1 + 1,
    list_length(T, N1).
