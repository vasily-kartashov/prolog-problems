:- use_module(library(dcgs)).

reversal([]) --> [].
reversal([L|Ls]) --> reversal(Ls), [L].

list_reversed(A, B) :-
    phrase(reversal(A), B).

palindrome --> [].
palindrome --> [_].
palindrome --> [E], palindrome, [E].
