:- module(problem_601, [read_graph/3]).

:- op(500, xfx, >).

:- use_module(library(lists)).
:- use_module(library(ordsets)).
:- use_module(library(lambda)).

read_graph(Format, Graph, graph(Nodes, Edges)) :-
    maplist(read_entry(Format), Graph, Entries),
    foldl(\[N,E] ^ [N0,E0] ^ [N1,E1] ^ (ord_union(N0,N,N1), ord_union(E0,E,E1)), Entries, [[],[]], [Nodes,Edges]).

read_entry(human_friendly, E, [Nodes, Edges]) :-
    (   E = A>B/W -> Nodes0 = [A,B], Edges0 = [a(A,B,W)],           !
    ;   E = A-B/W -> Nodes0 = [A,B], Edges0 = [a(A,B,W), a(B,A,W)], !
    ;   E = A>B   -> Nodes0 = [A,B], Edges0 = [a(A,B,0)],           !
    ;   E = A-B   -> Nodes0 = [A,B], Edges0 = [a(A,B,0), a(B,A,0)], !
    ;                Nodes0 = [E],   Edges0 = [],                   !
    ),
    list_to_ord_set(Nodes0, Nodes),
    list_to_ord_set(Edges0, Edges).
