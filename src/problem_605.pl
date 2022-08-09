:- module(problem_605, [ms_tree/3]).

:- use_module(problem_604).

ms_tree(Graph, Tree, Sum) :-
    findall(Sum-Tree, s_tree(Graph, Tree, Sum), Trees),
    keysort(Trees, [Sum-Tree|_]).
