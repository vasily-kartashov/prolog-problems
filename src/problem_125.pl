:- module(problem_125, [pick/2]).

:- use_module(problem_104).
:- use_module(problem_121).
:- use_module(library(random)).

pick(A, R) :-
    nonvar(A),
    var(R),
    list_length(A, L),
    list_n_pick(A, L, R),
    !.

list_n_pick(_, 0, []).
list_n_pick(A, N, [R|R1]) :-
    N > 0,
    L is N + 1,
    random_integer(1, L, I),
    list_item_at_inserted(A1, R, I, A),
    N1 is N - 1,
    list_n_pick(A1, N1, R1).

