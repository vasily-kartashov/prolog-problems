:- use_module(library(clpz)).

n_factor(N, D) :-
    D #> 1,
    N #>= D,
    n_factor_(N, 2, D).

n_factor_(N, D, D) :-
    N mod D #= 0.
n_factor(N, D, R) :-
    D #< N,
    N mod D #= 0,
    N1 #= N div D,
    n_factor(N1, D, R).
n_factor(N, D, R) :-
    D #< N,
    N mod D #\= 0,
    D1 #= D + 1,
    n_factor(N, D1, R).
