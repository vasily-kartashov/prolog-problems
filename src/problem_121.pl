:- module(problem_121, [list_item_at_inserted/4]).

:- use_module(library(clpz)).

list_item_at_inserted(A, E, 1, [E|A]).
list_item_at_inserted([H|T], E, I, [H|U]) :-
    I #> 1,
    I1 #= I - 1,
    list_item_at_inserted(T, E, I1, U).
