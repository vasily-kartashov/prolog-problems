:- module(problem_206, [gcd/3]).

:- use_module(library(clpz)).
:- use_module(library(reif)).

gcd(A, B, C) :-
    #C #> 0, 
    #A #>= C, 
    #B #>= C,
    A mod C #= 0,
    B mod C #= 0,
    gcd1(A, B, C).

gcd1(A, B, C) :-
    R #= A mod B,
    if_(  R = 0
       ,  C = B
       ,  gcd1(B, R, C)
       ).
