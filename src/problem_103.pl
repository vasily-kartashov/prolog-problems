:- module(problem_103, [nth/3]).

:- use_module(library(clpz)).

nth(1, [A|_], A).
nth(I, [_|T], A) :- 
    #I #> 1, 
    I1 #= I - 1, 
    nth(I1, T, A).
