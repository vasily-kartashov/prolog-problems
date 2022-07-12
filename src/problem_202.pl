:- module(problem_202, [n_factors/2]).

:- use_module(library(clpz)).

n_factors(N, Fs) :-
    primes(Ps),
    N #> 1,
    n_factors_(N, Fs, Ps),
    (   integer(N) -> !
    ;   true
    ).

n_factors_(N, [N], [P|_]) :-
    P #=< N,
    P * P #> N.
n_factors_(N, [P|Fs], [P|Ps]) :-
    P * P #=< N,
    N #= N1 * P,
    n_factors_(N1, Fs, [P|Ps]).
n_factors_(N, [F|Fs], [P|Ps]) :-
    P #< F,
    P * P #=< N,
    N mod P #\= 0,
    N mod F #= 0,
    n_factors_(N, [F|Fs], Ps).
