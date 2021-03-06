:- module(problem_201, [primes/1, prime_t/2]).

:- use_module(library(freeze)).

primes(Ps) :-
    Ps = [2,3|T],
    primes0(5, Ps, Ps, T),
    !.

primes0(C, [D|Ds], Ps, T) :-
    (   D * D > C ->
	T = [C|T1], C1 is C + 2, freeze(T1, primes0(C1, Ps, Ps, T1))
    ;   (   C mod D =:= 0 ->
	    C1 is C + 2, primes0(C1, Ps, Ps, T)
	;   primes0(C, Ds, Ps, T)
	)
    ).

prime_t(A, T) :-
    var(A),
    primes(Ps),
    prime_t0(A, 2, Ps, T).
prime_t(A, T) :-
    integer(A),
    A > 1,
    primes(Ps),
    prime_t1(A, Ps, T),
    !.

prime_t0(I, I, [I|_], true).
prime_t0(A, I, [I|Ps], T) :-
    I1 is I + 1,
    prime_t0(A, I1, Ps, T).
prime_t0(I, I, [P|_], false) :-
    I < P.
prime_t0(A, I, [P|Ps], T) :-
    I1 is I + 1,
    prime_t0(A, I1, [P|Ps], T).

prime_t1(A, [P|_], true) :-
    P * P > A,
    !.
prime_t1(A, [P|_], false) :-
    A mod P =:= 0,
    !.
prime_t1(A, [_|Ps], T) :-
    prime_t1(A, Ps, T).
