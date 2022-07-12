:- module(problem_123, [pick_n/3]).

:- use_module(problem_104).
:- use_module(problem_121).
:- use_module(library(random)).

pick_n(A, N, R) :-
    nonvar(A),
    var(R),
    N > 0,
    list_length(A, L),
    L1 is L + 1,
    N < L1,
    list_n_limit_pick(A, N, L1, R),
    !.

list_n_limit_pick(_, 0, _, []).
list_n_limit_pick(A, N, L, [R|R1]) :-
    N > 0,
    random_integer(1, L, I),
    list_item_at_inserted(A1, R, I, A),
    N1 is N - 1,
    L1 is L - 1,
    list_n_limit_pick(A1, N1, L1, R1).
