:- module(problem_705, [number_words/2]).

:- use_module(library(clpz)).
:- use_module(library(dcgs)).

number_words(N, S) :-
    phrase(number(N, S, _), S).

digit(0) --> "zero".
digit(1) --> "one".
digit(2) --> "two".
digit(3) --> "three".
digit(4) --> "four".
digit(5) --> "five".
digit(6) --> "six".
digit(7) --> "seven".
digit(8) --> "eight".
digit(9) --> "nine".

number(I, L, L) -->
    { #I #< 10 },
    digit(I).

number(I, [_,_,_|L0], L) -->
    {   #I #> 9,
        R #= I mod 10,
        J #= I // 10
    },
    number(J, L0, L),
    ['-'],
    digit(R).
