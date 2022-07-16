:- module(problem_113, [list_encoded2/2]).

:- use_module(library(lists)).
:- use_module(library(clpz)).
:- use_module(library(dif)).

list_encoded2([], []).
list_encoded2(A, [B|T]):-
    n_char_code(N, C, B),
    list_top_length_tail(A, C, N, U),
    list_encoded2(U, T).

list_top_length_tail([A], A, 1, []).
list_top_length_tail([A,B|C], A, 1, [B|C]) :-
    dif(A, B).
list_top_length_tail([A,A|C], A, N, T) :-
    N #> 1,
    N #= N1 + 1,
    list_top_length_tail([A|C], A, N1, T).

n_char_code(1, C, C) :- var(C) ; atom(C).
n_char_code(I, C, [I,C]) :- I #> 1.
