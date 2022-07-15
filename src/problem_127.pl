:- module(problem_127, [group/3]).

:- use_module(problem_126).
:- use_module(library(lists)).

group(A, N, G) :-
    length(A, M),
    group(A, M, N, G).

group(_, _, [], []).
group(A, M, [N|T], [S|U]) :-
    #N #> 0,
    M #>= N,
    choose(A, N, S, A1),
    M1 #= M - N,
    group(A1, M1, T, U).
