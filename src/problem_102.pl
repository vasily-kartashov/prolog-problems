:- module(problem_102, [rnth/3]).

:- use_module(library(clpz)).
:- use_module(library(lists)).

rnth(A, I, E) :-
    #I #> 0,
    length(A, L),
    J #= L - I + 1,
    J #> 0,
    at(A, J, E).

at([A|_], 1, A).
at([_|T], I, A) :-
    I #> 1,
    I1 #= I - 1,
    at(T, I1, A).
