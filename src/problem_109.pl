:- module(problem_109, [list_packed/2]).

:- use_module(library(dif)).

list_packed([], []).
list_packed(A, [H|T]) :-
    list_head_tail(A, H, R),
    list_packed(R, T).

list_head_tail([A], [A], []).
list_head_tail([A,A|C], [A|H], T) :-
    list_head_tail([A|C], H, T).
list_head_tail([A,B|C], [A], [B|C]) :-
    dif(A, B).
