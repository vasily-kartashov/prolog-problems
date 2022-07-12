:- module(problem_108, [list_dedup/2]).

:- use_module(library(dif)).

list_dedup(A, B) :-
    nodup(B),
    list_dedup_(A, B).
    
list_dedup_([], []).
list_dedup_([A], [A]).    
list_dedup_([A,B|T], [A,B|U]) :-
    dif(A, B),    
    list_dedup_([B|T], [B|U]).
list_dedup_([A,A|T], [A|U]) :-
    list_dedup_([A|T], [A|U]).

nodup([_]).
nodup([A,B|T]) :- dif(A, B), nodup([B|T]).    
