:- module(problem_116, [list_nth_dropped/3]).

:- use_module(problem_104).
:- use_module(library(clpz)).

list_nth_dropped(A, N, R) :-
    N #> 0,
    list_i_nth_dropped(A, 1, N, R).

list_i_nth_dropped([], _, _, []).
list_i_nth_dropped([A|T], I, N, [A|R]) :-
    I #< N,
    I1 #= I + 1,
    list_i_nth_dropped(T, I1, N, R).
list_i_nth_dropped([_|T], N, N, R) :-
    list_i_nth_dropped(T, 1, N, R).

