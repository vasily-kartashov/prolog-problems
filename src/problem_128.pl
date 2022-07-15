:- module(problem_128, [lsort/2, lfsort/2]).

:- use_module(library(lists)).
:- use_module(library(pairs)).

lsort(A, B) :-
    map_list_to_pairs(length, A, P),
    keysort(P, S),
    pairs_values(S, B).

lfsort(A, B) :-
    map_list_to_pairs(length, A, P),
    keysort(P, P1),
    group_pairs_by_key(P1, G),
    keysort(G, S),
    pairs_values(S, G1),
    map_list_to_pairs(length, G1, P2),
    write(P2), nl,
    keysort(P2, P3),
    pairs_values(P3, B0),
    flatten(B0, B).

flatten([], []).
flatten([[]|T], B) :- flatten(T, B).
flatten([[A|U]|T], [A|B]) :- flatten([U|T], B).
