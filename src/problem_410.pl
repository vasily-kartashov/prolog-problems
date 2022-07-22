:- module(problem_410, [tree_internals/2]).

:- use_module(library(lists)).

tree_internals(nil, []).
tree_internals(t(_, nil, nil), []).
tree_internals(t(E, t(A, B, C), nil), [E|Ls]) :-
    tree_internals(t(A, B, C), Ls).
tree_internals(t(E, nil, t(A, B, C)), [E|Ls]) :-
    tree_internals(t(A, B, C), Ls).
tree_internals(t(E, t(A0, B0, C0), t(A1, B1, C1)), [E|Ls]) :-
    tree_internals(t(A0, B0, C0), P),
    tree_internals(t(A1, B1, C1), S),
    append(P, S, Ls).
