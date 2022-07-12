:- module(problem_105, [list_reversed/2]).

list_reversed(A, B) :- orig_acc_rev(A, [], B).

orig_acc_rev([], A, A).
orig_acc_rev([E|T], A, R) :-
    orig_acc_rev(T, [E|A], R). 
