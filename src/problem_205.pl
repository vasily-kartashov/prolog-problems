:- module(problem_205, [goldbach/2]).

:- use_module(problem_204).
:- use_module(library(clpz)).
:- use_module(library(lists)).

goldbach(I, [A,B]) :-
    #I #> 2,
    I mod 2 #= 0,
    range_primes(2, I, Ps),
    find_sum([A,B], I, Ps).

find_sum([A,B], I, [A|T]) :-
    B #= I - A,
    member(B, [A|T]).
find_sum(S, I, [_|T]) :-
    find_sum(S, I, T).
