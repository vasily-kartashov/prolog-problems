:- module(problem_404, [list_btree/2]).

:- use_module(library(clpz)).

list_btree(L, T) :-
    list_btree_acc(L, T, nil).

list_btree_acc([], T, T).
list_btree_acc([A|B], T, T0) :-
    add(A, T0, T1),
    list_btree_acc(B, T, T1).

add(X, nil, t(X, nil, nil)).
add(X, t(Root, L, R), t(Root, L1, R)) :-
    #X #< Root,
    add(X, L, L1).
add(X, t(Root, L, R), t(Root, L, R1)) :-
    #X #> Root,
    add(X, R, R1).
