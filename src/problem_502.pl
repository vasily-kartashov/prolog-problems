:- module(problem_502, [nodes_count/2]).

:- use_module(library(clpz)).

nodes_count(t(_, []), 1).
nodes_count(t(_, [A|T]), N) :-
    N #> 1,
    N0 #> 0,
    N1 #> 0,
    N #= N0 + N1,
    nodes_count(A, N0),
    nodes_count(t(_, T), N1).
