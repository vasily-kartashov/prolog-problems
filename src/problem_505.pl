:- module(problem_505, [bottom_up/2]).

:- use_module(library(dcgs)).

bottom_up(T, S) :-
    phrase(bottom_up(T, S, _), S).

bottom_up(t(A, B), Ls0, Ls1) -->
    bottom_up1(B, Ls0, Ls1),
    [A].

bottom_up1([], Ls, Ls) -->
    "".
bottom_up1([A|T], [_|Ls0], Ls) -->
    bottom_up(A, Ls0, Ls1),
    bottom_up1(T, Ls1, Ls).
