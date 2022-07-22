:- module(problem_408, [count_leaves/2, depth/2]).

:- use_module(library(clpfd)).

count_leaves(nil, 0).
count_leaves(t(_, nil, nil), 1).
count_leaves(t(_, t(A, B, C), nil), N) :-
    N #> 0,
    count_leaves(t(A, B, C), N).
count_leaves(t(_, nil, t(A, B, C)), N) :-
    N #> 0,
    count_leaves(t(A, B, C), N).
count_leaves(t(_, t(A0, B0, C0), t(A1, B1, C1)), N) :-
    N #> 1,
    L #> 0,
    R #> 0,
    N #= L + R,
    count_leaves(t(A0, B0, C0), L),
    count_leaves(t(A1, B1, C1), R).

depth(nil, 0).
depth(t(_, A, B), N) :-
    N #> 0,
    L #>= 0,
    R #>= 0,
    N #= 1 + max(L, R),
    depth(A, L),
    depth(B, R).
