:- module(problem_101, [my_last/2]).

my_last([A|T], E) :-
    my_last(T, A, E). 

my_last([], E, E).
my_last([A|T], _, E) :-
    my_last(T, A, E).

:- begin_tests(problem_101).

test(my_last) :-
    my_last([A], A).
test(my_last, [fail]) :-
    my_last([], _).
test(my_last) :-
    my_last([_,A], A).

:- end_tests(problem_101).
