:- module(problem_706, [identifier/1]).

:- use_module(library(lists)).
:- use_module(library(dcgs)).

identifier(A) :-
    phrase(identifier, A).
    
identifier -->
    letter,
    identifier1.

identifier1 --> [].
identifier1 -->
    alphanumeric,
    identifier1.
identifier1 -->
    underscore,
    alphanumeric,
    identifier1.

letter -->
    { member(A, "abcdefghijklmnopqrstuvwxyz") },
    [A].

digit -->
    { member(A, "0123456789") },
    [A].

alphanumeric --> letter.
alphanumeric --> digit.

underscore --> ['_'].
