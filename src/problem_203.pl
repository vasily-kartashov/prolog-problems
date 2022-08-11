:- module(problem_203, [prime_factors_mult/2]).

:- use_module(problem_110).
:- use_module(problem_202).

prime_factors_mult(N, M) :-
    n_factors(N, F),
    encode(F, M).

