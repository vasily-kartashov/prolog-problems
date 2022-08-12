:- module(problem_103, [my_nth1/3]).

:- use_module(library(clpfd)).

my_nth1(1, [A|_], A).
my_nth1(I, [_|T], A) :- 
    I #> 1,
    I1 #= I - 1, 
    my_nth1(I1, T, A).

:- begin_tests(problem_103).

test(my_nth1, [fail]) :-
    my_nth1(1, [], _).
test(my_nth1, [nondet]) :-
    my_nth1(1, [A], A).
test(my_nth1, [nondet]) :-
    my_nth1(2, [_,A], A).
test(my_nth1, [fail]) :-
    my_nth1(0, [_], _).
test(my_nth1, [fail]) :-
    my_nth1(3, [_,_], _).
test(my_nth1, [nondet]) :-
    my_nth1(3, [_|T], A),
    my_nth1(2, T, A).
test(my_nth1, all(I-A == [1-a,2-b,3-c])) :-
    my_nth1(I, [a,b,c], A).
test(my_nth1, all(I == [1, 4])) :-
    my_nth1(I, [a,b,c,a], a).

:- end_tests(problem_103).
