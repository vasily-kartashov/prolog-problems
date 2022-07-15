:- module(problem_124, [draw_n/3]).

:- use_module(problem_104).
:- use_module(problem_121).
:- use_module(library(random)).

draw_n(A, N, R) :-
    nonvar(A),
    integer(N),
    var(R),
    N > 0,
    list_length(A, M),
    M >= N,
    list_n_pick(A, N, M, R),
    !.

list_n_pick(_, 0, _, []).
list_n_pick(A, N, M, [R|R1]) :-
    N > 0,
    L is M + 1,
    random_integer(1, L, I),
    list_item_at_inserted(A1, R, I, A),
    N1 is N - 1,
    M1 is M - 1,
    list_n_pick(A1, N1, M1, R1).
