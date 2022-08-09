:- module(problem_604, [s_tree/3]).

:- use_module(library(lists)).
:- use_module(library(ordsets)).

s_tree(graph(Nodes, Edges), Tree, Sum) :-
    member(A, Nodes),
    ord_del_element(Nodes, A, Nodes0),
    s_tree(A, Nodes0, [], Edges, Tree, Sum).

s_tree(A, Nodes, Nodes, _, t(A, []), 0).
s_tree(A, Nodes, Nodes2, Edges, t(A, [T|Children]), Sum) :-
    member(B, Nodes),
    member(a(A, B, W), Edges),
    ord_del_element(Nodes, B, Nodes0),
    s_tree(B, Nodes0, Nodes1, Edges, T, Sum1),
    s_tree(A, Nodes1, Nodes2, Edges, t(A, Children), Sum2),
    Sum is Sum1 + Sum2 + W.
