:- module(problem_408, [count_leaves/2, depth/2]).

:- use_module(library(clpz)).

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

depth(A, T) :-
    T #>= 0,
    depth(A, 0, T).

depth(nil, N, N).
depth(t(_, A, B), N0, N) :-
    N0 #=< N,
    N1 #= N0 + 1,
    L #>= 0,
    R #>= 0,
    N #= max(L, R),
    depth(A, N1, L),
    depth(B, N1, R).
