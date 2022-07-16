:- module(problem_204, [range_primes/3]).

:- use_module(problem_201).
:- use_module(library(clpz)).

range_primes(A, B, R) :-
    primes(Ps),
    #A #=< #B,
    range_primes(A, B, R, Ps).

range_primes(A, B, T, [P|U]) :-
    P #< A,
    range_primes(A, B, T, U).
range_primes(A, B, [P|T], [P|Ps]) :-
    A #=< P,
    P #=< B,
    range_primes(P, B, T, Ps).
range_primes(_, B, [], [P|_]) :-
    B #< P.
