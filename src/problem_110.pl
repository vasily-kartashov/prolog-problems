:- module(problem_110, [list_encoded/2]).

:- use_module(library(lists)).
:- use_module(library(clpz)).
:- use_module(library(dif)).

list_encoded([], []).
list_encoded(A, [[N,C]|T]):-
    list_top_length_tail(A, C, N, U),
    list_encoded(U, T).

list_top_length_tail([A], A, 1, []).
list_top_length_tail([A,B|C], A, 1, [B|C]) :-
    dif(A, B).
list_top_length_tail([A,A|C], A, N, T) :-
    N #> 1,
    N #= N1 + 1,
    list_top_length_tail([A|C], A, N1, T).
