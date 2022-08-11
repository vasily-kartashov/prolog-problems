:- module(problem_114, [dupli/2]).

dupli([], []).
dupli([A|T], [A,A|S]) :-
    dupli(T, S).
