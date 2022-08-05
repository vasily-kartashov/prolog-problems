:- module(problem_603, [cycle/3]).

:- use_module(library(lists)).

cycle(graph(Nodes, Edges), A, Path) :-
    member(A, Nodes),
    cycle(Edges, A, A, [], Path).

cycle(Edges, A, B, V, [B|T]) :-
    member(a(B, C, _), Edges),
    \+ member(C, V),
    (   C = A ->
        T = [A]
    ;   cycle(Edges, A, C, [C|V], T)
    ).

    
