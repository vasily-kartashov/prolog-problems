:- module(problem_602, [path/5]).

:- use_module(library(lists)).

path(graph(Nodes, Edges), A, B, P, D) :-
    member(A, Nodes),
    member(B, Nodes),
    path(Edges, A, B, [], P, 0, D).

path(_, A, A, _, [A], D, D).
path(Edges, A, B, V, [A|T], D0, D) :-
    member(a(A, C, D1), Edges),
    \+ member(C, V),
    D2 is D0 + D1,
    path(Edges, C, B, [A|V], T, D2, D).
