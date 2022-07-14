:- module(problem_118, [list_i_j_slice/4]).

:- use_module(library(clpz)).

list_i_j_slice(A, I, J, S) :-
    #I #>= 1,
    #J #>= I,
    I0 #= I - 1,
    list_i_j_slice_(A, I0, J, S).

list_i_j_slice_(_, 0, 0, []).
list_i_j_slice_([H|T], 0, J, [H|R]) :-
    J #> 0,
    J1 #= J - 1,
    list_i_j_slice_(T, 0, J1, R).
list_i_j_slice_([_|T], I, J, R) :-
    I #> 0,
    I1 #= I - 1,
    J1 #= J - 1,
    list_i_j_slice_(T, I1, J1, R).
