n_rlfactors(N, E) :-
    n_factors(N, F),
    list_rlencoded(F, E).
