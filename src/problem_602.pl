:- module(problem_602, [path/5]).

:- use_module(library(lists)).

path(graph(Nodes, Edges), A, B, P, D) :-
    member(A, Nodes),
    member(B, Nodes),
    path(Edges, A, B, [], P, D).

path(Edges, A, A, _, [A], 0).
path(Edges, A, B, V, [A|T], D) :-
    member(a(A, C, D0), Edges),
    \+ member(C, V),
    path(Edges, C, B, [A|V], T, D1),
    D is D0 + D1.
