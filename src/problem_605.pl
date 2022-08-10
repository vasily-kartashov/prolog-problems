:- module(problem_605, [ms_tree/3]).

:- use_module(plist).
:- use_module(library(dif)).
:- use_module(library(lambda)).
:- use_module(library(lists)).
:- use_module(library(ordsets)).

ms_tree(graph(Nodes, Edges), Tree, Sum) :-
    foldl(\a(A, B, D) ^ L0 ^ plist(L0, D-(A-B)), Edges, [], Edges1),
    member(A, Nodes),
    ord_del_element(Nodes, A, Nodes1),
    ms_tree(Edges1, [A], Nodes1, t(A, []), Tree, 0, Sum).

ms_tree(_, _, [], Tree, Tree, Sum, Sum).
ms_tree(Edges, Visited, Outstanding, Tree0, Tree, Sum0, Sum) :-
    plist(Edges1, D-(A-B), Edges),
    member(A, Visited),
    member(B, Outstanding),
    ord_del_element(Outstanding, B, Outstanding1),
    tree_add(Tree0, A-B, Tree1),
    Sum1 is Sum0 + D,
    ms_tree(Edges1, [B|Visited], Outstanding1, Tree1, Tree, Sum1, Sum).

tree_add(t(A, Children), A-B, t(A, [t(B, [])|Children])).
tree_add(t(D, Children), A-B, t(D, Children1)) :-
    dif(A, D),
    maplist(\C ^ C1 ^ tree_add(C, A-B, C1), Children, Children1).
