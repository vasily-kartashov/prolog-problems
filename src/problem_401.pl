:- module(problem_401, [is_tree/1]).

is_tree(nil).
is_tree(t(_, A, B)) :-
    is_tree(A), is_tree(B).
