:- module(problem_604, [s_tree/2]).

:- use_module(library(lists)).
:- use_module(library(ordsets)).

s_tree(graph(Nodes, Edges), Tree) :-
    member(A, Nodes),
    ord_del_element(Nodes, A, Nodes0),
    s_tree(A, Nodes0, [], Edges, Tree).

s_tree(A, Nodes, Nodes, _, t(A, [])).
s_tree(A, Nodes, Nodes2, Edges, t(A, [T|Children])) :-
    member(B, Nodes),
    member(a(A, B, _), Edges),
    ord_del_element(Nodes, B, Nodes0),
    s_tree(A, Nodes0, Nodes1, Edges, t(A, Children)),
    s_tree(B, Nodes1, Nodes2, Edges, T).
