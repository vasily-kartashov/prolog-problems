:- module(problem_122, [range/3]).

:- use_module(library(clpz)).

range(I, I, [I]) :- #I.
range(I, J, [I|R]) :-
    #I #< #J,
    I1 #= I + 1,
    range(I1, J, R).
