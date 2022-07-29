:- module(problem_305, [is_plist/1,
			plist/3,
			flist_plist/2,
			prefix/3,
		        huffman/2]).

% this is ugly and is direct translation from https://rosettacode.org/wiki/Huffman_coding#PHP

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

% todo rewrite with an accumulator
flist_plist([], []).
flist_plist([fr(A,I)|T], P) :-
    flist_plist(T, P0),
    I1 #= -I,
    plist(P0, I1-[A-[]], P).

is_plist([]).
is_plist([_-_]).
is_plist([I-_,J-B|T]) :-
    I #>= J,
    is_plist([J-B|T]).

plist([], A, [A]).
plist([I-A|T], J-B, [J-B,I-A|T]) :-
    J #>= I,
    is_plist([I-A|T]).
plist([I-A|T], J-B, [I-A|C]) :-
    J #=< I,
    plist(T, J-B, C),
    is_plist([I-A|T]).
