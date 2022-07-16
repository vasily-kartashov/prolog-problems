primes_below(L, P) :-
    integer(L),
    primes(Ps),
    primes_below(L, P, Ps),
    !.

primes_below(L, [], [P|_]) :-
    L < P.
primes_below(L, [P|T], [P|Ps]) :-
    P < L,
    primes_below(L, T, Ps).
