:- use_module(library(clpz)).

list_n_sublist_complement(A, 0, [], A).
list_n_sublist_complement([A|T], I, [A|U], C) :-
    I #> 0,
    I1 #= I - 1,
    list_n_sublist_complement(T, I1, U, C).
list_n_sublist_complement([H|T], I, [B|U], [H|C]) :-
    I #> 0,
    list_n_sublist_complement(T, I, [B|U], C).
