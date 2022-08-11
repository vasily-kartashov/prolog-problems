:- module(problem_111, [encode_modified/2]).

:- use_module(library(clpz)).
:- use_module(library(dif)).

encode_modified([], []).
encode_modified([A], [A]).
encode_modified([A,B|T], [A|E]) :-
    dif(A, B),
    encode_modified([B|T], E).
encode_modified([A,A|T], [[A,N]|E]) :-
    N #> 2,
    N1 #= N - 1,
    encode_modified([A|T], [[A,N1]|E]).
encode_modified([A,A|T], [[A,2]|E]) :-
    encode_modified([A|T], [A|E]).

