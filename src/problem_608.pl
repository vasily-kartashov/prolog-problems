:- module(problem_608, [traverse/3]).

:- use_module(library(lists)).

traverse(graph(Nodes, Edges), A, [A|T]) :-
    select(A, Nodes, Nodes1),
    dfa(Edges, A, Nodes1, T).

dfa(_, _, [], []).
dfa(Edges, A, Outstanding, [B|Tail]) :-
    member(a(A, B, _), Edges),
    select(B, Outstanding, Outstanding1),
    dfa(Edges, B, Outstanding1, Tail).
