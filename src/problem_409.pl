:- module(problem_409, [tree_leaves/2]).

:- use_module(library(dif)).
:- use_module(library(lists)).

tree_leaves(t(A, nil, nil), [A]).
tree_leaves(t(_, B, nil), L) :-
    dif(B, nil),
    tree_leaves(B, L).
tree_leaves(t(_, nil, B), L) :-
    dif(B, nil),
    tree_leaves(B, L).
tree_leaves(t(_, B, C), L) :-
    append(L0, L1, L),
    tree_leaves(B, L0),
    tree_leaves(C, L1).
