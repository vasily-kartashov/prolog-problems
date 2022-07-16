list_ns_sublists([], [], []).
list_ns_sublists(A, [I|J], [B|T]) :-
    list_n_sublist_complement(A, I, B, C),
    list_ns_sublists(C, J, T).
