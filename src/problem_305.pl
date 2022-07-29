:- module(problem_305, [huffman/2]).

:- use_module(plist).
:- use_module(library(lists)).

huffman(F, H) :-
    flist_plist(F, P),
    reduce(P, [_-H]).

reduce([A], [A]).
reduce([I-L,J-H|T], P) :-
    K #= I + J,
    prefix(L, '0', L1),
    prefix(H, '1', H1),
    append(L1, H1, S),
    plist(T, K-S, T1),
    reduce(T1, P).

prefix([], _, []).
prefix([C-H|T], B, [C-[B|H]|T1]) :-
    prefix(T, B, T1).

flist_plist(F, P) :-
    foldl(plist_append, F, [], P). 

plist_append(fr(A,I), P0, P) :-
    I1 #= -I,
    plist(P0, I1-[A-[]], P).
