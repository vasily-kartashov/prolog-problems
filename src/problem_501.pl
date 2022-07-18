:- module(problem_501, [mtree/1]).

mtree(t(_, [])).
mtree(t(_, [A|T])) :-
    mtree(A),
    mtree(t(_, T)).
