:- module(problem_115, [dupli/3]).

:- use_module(library(clpz)).

dupli(_, 0, []).
dupli(A, I, B) :-
    I #> 0,
    dupli(A, I, 0, B).

dupli([], _, _, []).
dupli([_|T], I, I, R) :-
    I #> 0,
    dupli(T, I, 0, R).
dupli([A|T], I, J, [A|R]) :-
    J #>= 0,
    I #> J,
    J1 #= J + 1,
    dupli([A|T], I, J1, R).
