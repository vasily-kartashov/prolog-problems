:- module(problem_119, [rotate/3]).

:- use_module(library(clpz)).
:- use_module(library(lists)).

rotate([], _, []).
rotate(A, 0, A).
rotate(A, I, R) :-
    #I #\= 0,
    length(A, L),
    I1 #= I mod L,
    split(A, I1, P, S),
    append(S, P, R).

split(A, 0, [], A).
split([A|T], I, [A|U], B) :-
    #I #> 0,
    I1 #= I - 1,
    split(T, I1, U, B).
