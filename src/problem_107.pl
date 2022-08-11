:- module(problem_107, [flatten/2]).

:- use_module(library(lists)).

flatten([], []).
flatten([A|T], F) :-
    is_list(A),
    !,
    flatten(A, B),
    flatten(T, C),
    append(B, C, F).
flatten([A|T], [A|F]) :-
    flatten(T, F).

is_list(A) :-
    var(A), !, fail.
is_list([]).
is_list([_|_]).
