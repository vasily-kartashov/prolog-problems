:- module(plist, [is_plist/1, plist/3]).

:- use_module(library(clpz)).

is_plist([]).
is_plist([_-_]).
is_plist([I-_,J-B|T]) :-
    I #=< J,
    is_plist([J-B|T]).

plist(A, I-B, C) :-
    plist1(A, I-B, C),
    is_plist(A),
    is_plist(C).

plist1([], A, [A]).
plist1([I-A|T], J-B, [J-B,I-A|T]) :-
    J #=< I.
plist1([I-A|T], J-B, [I-A|C]) :-
    J #>= I,
    plist1(T, J-B, C).
