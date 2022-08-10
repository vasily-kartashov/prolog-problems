:- module(problem_608, [traverse/3]).

:- use_module(library(lists)).
:- use_module(library(ordsets)).

traverse(graph(Nodes, Edges), A, [A|T]) :-
    member(A, Nodes),
    ord_del_element(Nodes, A, Nodes1),
    dfa(Edges, A, Nodes1, T).

dfa(_, _, [], []).
dfa(Edges, A, Outstanding, [B|Tail]) :-
    member(a(A, B, _), Edges),
    member(B, Outstanding),
    ord_del_element(Outstanding, B, Outstanding1),
    dfa(Edges, B, Outstanding1, Tail).
