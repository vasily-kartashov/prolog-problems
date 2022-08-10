:- module(problem_604, [s_tree/3]).

:- use_module(library(lists)).

s_tree(graph(Nodes, Edges), Tree, Sum) :-
    select(A, Nodes, Nodes0),
    s_tree(A, Nodes0, [], Edges, Tree, 0, Sum).

s_tree(A, Nodes, Nodes, _, t(A, []), Sum, Sum).
s_tree(A, Nodes, Nodes2, Edges, t(A, [T|Children]), Sum0, Sum) :-
    select(B, Nodes, Nodes0),
    member(a(A, B, W), Edges),
    Sum1 is Sum0 + W,
    s_tree(B, Nodes0, Nodes1, Edges, T, Sum1, Sum2),
    s_tree(A, Nodes1, Nodes2, Edges, t(A, Children), Sum2, Sum).
