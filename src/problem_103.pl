:- module(problem_103, [list_n_nth/3]).
    
:- use_module(library(clpz)).

list_n_nth([A|_], 1, A).
list_n_nth([_|T], N, A) :- 
    N #> 1, 
    N1 #= N - 1, 
    list_n_nth(T, N1, A).
