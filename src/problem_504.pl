:- module(problem_504, [tree_ipl/2]).

:- use_module(library(clpz)).

tree_ipl(T, N) :- 
    #N #>= 0,
    tree_ipl(T, 0, N).

tree_ipl(t(_, A), L, N) :-
    0 #=< L,
    L #=< N,
    L1 #= L + 1,
    0 #=< N0,
    N #= L + N0,
    tree_ipl1(A, L1, N0).

tree_ipl1([], _, 0).
tree_ipl1([A|T], L, N) :-
    0 #=< L,
    L #=< N0,
    0 #=< N1,
    N #= N0 + N1,
    tree_ipl(A, L, N0),
    tree_ipl1(T, L, N1).
