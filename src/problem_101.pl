:- module(problem_101, [my_last/2]).

my_last([A], A).
my_last([_|T], X) :-
    my_last(T, X).

:- begin_tests(problem_101).

test(my_last, [nondet]) :-
    my_last([A], A).
test(my_last, [fail]) :-
    my_last([], _).
test(my_last, [nondet]) :-
    my_last([_,B|T], L),
    my_last([B|T], L).

:- end_tests(problem_101).

