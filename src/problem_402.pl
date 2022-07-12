:- module(problem_402, [balanced_tree/2]).

:- use_module(library(clpz)).

balanced_tree(0, nil).
balanced_tree(I, t(_, A, B)) :-
    I #> 0,
    I1 #= I - 1,
    R #= I1 mod 2,
    I2 #= (I1 - R) / 2,
    balanced_tree_(I, t(_, A, B), I2, R).
balanced_tree_(_, t(_, A, B), I, 0) :-
    balanced_tree(I, A),
    balanced_tree(I, B).
balanced_tree_(_, t(_, A, B), I, 1) :-
    I1 #= I + 1,
    balanced_tree(I, A),
    balanced_tree(I1, B).
balanced_tree_(_, t(_, A, B), I, 1) :-
    I1 #= I + 1,
    balanced_tree(I1, A),
    balanced_tree(I, B).
