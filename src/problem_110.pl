:- module(problem_110, [encode/2]).

:- use_module(library(dif)).

encode([], []).
encode([A], [[A,1]]).
encode([A,B|T], [[A,1]|E]) :-
    dif(A, B),
    encode([B|T], E).
encode([A,A|T], [[A,N]|E]) :-
    N #> 0,
    N1 #= N - 1,
    encode([A|T], [[A,N1]|E]).
