:- module(plist, [is_plist/1, plist/3]).

:- use_module(library(clpz)).

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
