:- use_module(library(lists)).
:- use_module(library(clpz)).

list_mrlencoded(A, E) :-
    list_rlencoded(A, R),
    maplist(code_reduced, R, E).

code_reduced([1,A], A).
code_reduced([I,A], [I,A]) :- I #> 1.
