:- module(problem_107, [my_flatten/2]).

% I think this can be solved more elegantly by stating how many pair of [] we need to distribute over F
% thus regularizing the solutionx

:- use_module(library(lists)).

my_flatten([], []).
my_flatten([A|T], F) :-
    is_list(A),
    !,
    my_flatten(A, B),
    my_flatten(T, C),
    append(B, C, F).
my_flatten([A|T], [A|F]) :-
    my_flatten(T, F).

is_list(A) :-
    var(A), !, fail.
is_list([]).
is_list([_|_]).
