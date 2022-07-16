:- module(problem_206, [gcd/3]).

:- use_module(library(clpz)).
:- use_module(library(reif)).

gcd(A, B, C) :-
    #C #> 0, #A #>= C, #B #>= C,
    R #= A mod B,
    A mod C #= 0,
    B mod C #= 0,
    if_(  R = 0
       ,  C = B
       ,  gcd(B, R, C)
       ).
