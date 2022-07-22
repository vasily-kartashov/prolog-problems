:- module(problem_409, [tree_leaves/2]).

:- use_module(library(dif)).
:- use_module(library(lists)).

tree_leaves(nil, []).
tree_leaves(t(A, nil, nil), [A]).
tree_leaves(t(_, t(A, B, C), nil), [L|Ls]) :-
    tree_leaves(t(A, B, C), [L|Ls]).
tree_leaves(t(_, nil, t(A, B, C)), [L|Ls]) :-
    tree_leaves(t(A, B, C), [L|Ls]).
tree_leaves(t(_, t(A0, B0, C0), t(A1, B1, C1)), [L0,L1|Ls]) :-
    tree_leaves(t(A0, B0, C0), [P0|Ps]),
    tree_leaves(t(A1, B1, C1), [S0|Ss]),
    append([P0|Ps], [S0|Ss], [L0,L1|Ls]).
