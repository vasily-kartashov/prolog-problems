:- module(problem_104, [my_length/2]).

:- use_module(library(clpfd)).

my_length(L, N) :-
    N #>= 0,
    my_length(L, 0, N).

my_length([], N, N).
my_length([_|T], I, N) :-
    I #< N,
    I1 #= I + 1,
    my_length(T, I1, N).

:- begin_tests(problem_104).

test(my_length) :-
    my_length([], 0).
test(my_length) :-
    my_length(A, 0),
    A == [].
test(my_length) :-
    my_length([], N),
    N =:= 0.

:- end_tests(problem_104).
