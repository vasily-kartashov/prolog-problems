:- module(problem_112, [encode_modified/2]).

:- use_module(library(clpz)).
:- use_module(library(dif)).

encode_modified([], []).
encode_modified([A], [A]) :-
    ( var(A) ; atom(A) ).
encode_modified([A,B|T], [A|E]) :-
    ( var(A) ; atom(A) ),
    dif(A, B),
    encode_modified([B|T], E).
encode_modified([A,A|T], [[A,N]|E]) :-
    ( var(A) ; atom(A) ),
    N #> 2,
    N1 #= N - 1,
    encode_modified([A|T], [[A,N1]|E]).
encode_modified([A,A|T], [[A,2]|E]) :-
    ( var(A) ; atom(A) ),
    encode_modified([A|T], [A|E]).
