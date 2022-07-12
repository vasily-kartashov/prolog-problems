:- module(problem_115, [list_n_duplicated/3]).

:- use_module(library(clpz)).

list_n_duplicated(_, 0, []).
list_n_duplicated(A, I, B) :-
    I #> 0,
    list_n_i_duplicated(A, I, 0, B).

list_n_i_duplicated([], _, _, []).
list_n_i_duplicated([_|T], I, I, R) :-
    I #> 0,
    list_n_i_duplicated(T, I, 0, R).
list_n_i_duplicated([A|T], I, J, [A|R]) :-
    J #>= 0,
    I #> J,
    J1 #= J + 1,
    list_n_i_duplicated([A|T], I, J1, R).
