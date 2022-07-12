:- module(problem_202, [n_factors/2]).

:- use_module(problem_201).
:- use_module(library(clpz)).

n_factors(N, Fs) :-
    primes(Ps),
    N #> 1,
    n_factors_primes(N, Fs, Ps),
    (   integer(N) -> !
    ;   true
    ).

n_factors_primes(N, [N], [P|_]) :-
    P #=< N,
    P * P #> N.
n_factors_primes(N, [P|Fs], [P|Ps]) :-
    P * P #=< N,
    N #= N1 * P,
    n_factors_primes(N1, Fs, [P|Ps]).
n_factors_primes(N, [F|Fs], [P|Ps]) :-
    P #< F,
    P * P #=< N,
    N mod P #\= 0,
    N mod F #= 0,
    n_factors_primes(N, [F|Fs], Ps).
