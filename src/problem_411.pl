:- module(problem_411, [atlevel/3]).

:- use_module(library(clpz)).
:- use_module(library(lists)).

atlevel(T, N, L) :-
    #N #> 0,
    atlevel(T, 1, N, L).

atlevel(nil, _, _, []).
atlevel(t(E, _, _), I, I, [E]).
atlevel(t(_, A, B), I, N, L) :-
    I #< N,
    I1 #= I + 1,
    atlevel(A, I1, N, L0),
    atlevel(B, I1, N, L1),
    append(L0, L1, L).
