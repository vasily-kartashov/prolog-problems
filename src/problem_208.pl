:- module(problem_208, [coprime/2]).

:- use_module(problem_207).

coprime(A, B) :-
    gcd(A, B, 1).
