:- module(problem_102, [rnth0/3]).

:- use_module(library(lists)).

rnth0(N, Es, E) :-
    (   integer(N) ->
	rnth0_index(N, Es, E)
    ;   rnth0_search(N, Es, E)
    ).

rnth0_index(N, Es, E) :-
    length(Es, L),
    I is L - N - 1,
    nth0(I, Es, E).

rnth0_search(N, Es, E) :-
    reverse(Es, Es1),
    nth0(N, Es1, E).

:- begin_tests(problem_102).

test(rnth0, [fail]) :-
    rnth0(0, [], _).
test(rnth0) :-
    rnth0(0, [A], A).
test(rnth0) :-
    rnth0(1, [A,_], A).
test(rnth0, [fail]) :-
    rnth0(2, [_,_], _).
test(rnth0, all(I-A == [0-c,1-b,2-a])) :-
    rnth0(I, [a,b,c], A).

:- end_tests(problem_102).
