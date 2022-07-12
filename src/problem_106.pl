:- module(problem_106, [palindrome/1]).

:- use_module(problem_105).

palindrome(A) :-
    list_reversed(A, A).
