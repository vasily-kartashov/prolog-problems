:- module(problem_101, [list_last/2]).

list_last([X], X).
list_last([_|T], X) :-
    list_last(T, X).
