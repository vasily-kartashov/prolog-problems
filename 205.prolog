goldbach(A, [B,C]) :-
    integer(A),
    primes_below(A, Ps),
    member(B, Ps),
    member(C, Ps),
    B =< C,
    B + C =:= A.
