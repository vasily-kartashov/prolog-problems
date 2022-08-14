:- module(problem_114, [dupli/2]).

dupli([], []).
dupli([A|T], [A,A|S]) :-
    dupli(T, S).

:- begin_tests(problem_114).

test(dupli) :-
    dupli([], []).
test(dupli) :-
    dupli([A], [A,A]).
test(dupli) :-
    dupli(A, [a,a,b,E]),
    A == [a, b],
    E == b.
    
:- end_tests(problem_114).
