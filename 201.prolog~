:- use_module(library(freeze)).
:- use_module(library(tabling)).

:- table primes/1.

primes(Ps) :-
    Ps = [2,3|T],
    primes0(5, 0, 2, Ps, Ps, T),
    !.

primes0(C, N, N, _, Ps, [C|T]) :-
    C1 is C + 2,
    N1 is N + 1,
    freeze(T, primes0(C1, 0, N1, Ps, Ps, T)).
primes0(C, I, N, [D|Ds], Ps, T) :-
    I < N,
    (  D * D > C
    -> primes0(C, N, N, T, Ps, T)
    ;  (  C mod D =:= 0
       -> C1 is C + 1, primes0(C1, 0, N, Ps, Ps, T)
       ;  I1 is I + 1, primes0(C, I1, N, Ds, Ps, T)
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

