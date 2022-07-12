:- module(problem_102, [list_n_rnth/3]).

:- use_module(problem_103).
:- use_module(problem_104).
:- use_module(library(clpz)).

list_n_rnth(A, I, E) :-
    I #> 0,
    list_length(A, L),
    J #= L - I + 1,
    list_n_nth(A, J, E).
