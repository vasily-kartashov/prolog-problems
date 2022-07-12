:- module(problem_403, [tree_symmetric/1, tree_flip/2]).

tree_symmetric(A) :- tree_flip(A, A).

tree_flip(nil, nil).
tree_flip(t(_, B, C), t(_, C1, B1)) :-
    tree_flip(B, B1),
    tree_flip(C, C1).
