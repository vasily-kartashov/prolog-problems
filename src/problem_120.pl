:- module(problem_120, [list_at_removed/3]).

:- use_module(library(clpz)).

list_at_removed([_|T], 1, T).
list_at_removed([A|T], I, [A|U]) :-
    #I #> 1,
    I1 #= I - 1,
    list_at_removed(T, I1, U).
