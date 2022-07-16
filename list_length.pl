:- use_module(library(clpfd)).

list_length([], 0).
list_length([_|T], N) :- 
    N #> 0,
    N #= N1 + 1,
    list_length(T, N1).
