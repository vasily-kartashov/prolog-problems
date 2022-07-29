:- module(problem_305, [huffman/2]).

:- use_module(plist).
:- use_module(library(lists)).

huffman(F, H) :-
    flist_plist(F, P),
    reduce(P, [_-H]).

reduce([A], [A]).
reduce([I-L,J-H|T], P) :-
    K #= I + J,
    maplist(prefix('0'), L, L1),
    maplist(prefix('1'), H, H1),
    append(L1, H1, S),
    plist(T, K-S, T1),
    reduce(T1, P).

prefix(B, C-H, C-[B|H]).

flist_plist(F, P) :-
    foldl(plist_append, F, [], P). 

plist_append(fr(A,I), P0, P) :-
    I1 #= -I,
    plist(P0, I1-[A-[]], P).
