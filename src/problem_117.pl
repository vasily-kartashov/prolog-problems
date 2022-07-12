:- module(problem_117, [list_n_prefix_suffix/4]).

:- use_module(library(clpz)).

list_n_prefix_suffix(A, 0, [], A).
list_n_prefix_suffix([H|T], I, [H|U], B) :-
    I #> 0,
    I1 #= I - 1,
    list_n_prefix_suffix(T, I1, U, B).
