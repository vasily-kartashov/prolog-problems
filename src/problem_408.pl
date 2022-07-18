:- module(problem_408, [count_leaves/2, depth/2]).

:- use_module(library(clpz)).

count_leaves(nil, 0).
count_leaves(t(_, nil, nil), 1).
count_leaves(t(_, A, nil), N) :-
    A = t(_, _, _),
    N #> 0,
    count_leaves(A, N).
count_leaves(t(_, nil, B), N) :-
    B = t(_, _, _),
    N #> 0,
    count_leaves(B, N).
count_leaves(t(_, A, B), N) :-
    A = t(_, _, _),
    B = t(_, _, _),
    N #> 1,
    L #> 0,
    R #> 0,
    N #= L + R,
    count_leaves(A, L),
    count_leaves(B, R).

depth(nil, 0).
depth(t(_, nil, nil), 1).
depth(t(_, A, nil), N) :-
    A = t(_, _, _),
    N #> 1,
    N1 #= N - 1,
    depth(A, N1).
depth(t(_, nil, B), N) :-
    B = t(_, _, _),
    N #> 1,
    N1 #= N - 1,
    depth(B, N1).
depth(t(_, A, B), N) :-
    A = t(_, _, _),
    B = t(_, _, _),
    N #> 1,
    L #> 0,
    R #> 0,
    N #= 1 + max(L, R),
    depth(A, L),
    depth(B, R).
