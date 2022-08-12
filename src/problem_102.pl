:- module(problem_102, [rnth1/3]).

:- use_module(library(clpfd)).
:- use_module(library(lists)).

rnth1(I, A, E) :-
    I #> 0,
    length(A, L),
    J #= L - I,
    nth0(J, A, E).

:- begin_tests(problem_102).

test(rnth1, [fail]) :-
    rnth1(1, [], _).
test(rnth1) :-
    rnth1(1, [A], A).
test(rnth1) :-
    rnth1(2, [A,_], A).
test(rnth1, [fail]) :-
    rnth1(0, [_], _).
test(rnth1, [fail]) :-
    rnth1(3, [_,_], _).
test(rnth1, all(I-A == [3-a,2-b,1-c])) :-
    rnth1(I, [a,b,c], A).

:- end_tests(problem_102).

