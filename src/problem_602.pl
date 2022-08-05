:- module(problem_602, [path/5]).

:- use_module(library(lists)).

path(graph(Nodes, Edges), A, B, P, D) :-
    member(A, Nodes),
    member(B, Nodes),
    path(graph(Nodes, Edges), A, B, [], P, D).

path(graph(_, _), A, A, _, [A], 0).
path(graph(Nodes, Edges), A, B, V, [A|T], D) :-
    member(a(A, C, D0), Edges),
    \+ member(C, V),
    path(graph(Nodes, Edges), C, B, [A|V], T, D1),
    D is D0 + D1.
