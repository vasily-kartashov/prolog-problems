:- module(problem_107, [flatten/2]).

flatten(A, B) :-
    flat(B).

flatten(A, 0, A).
flatten(A, I, B) :-
    I #> 0,
    flatten1(A, A1),
    I1 #= I - 1,
    flatten(A1, I1, B).

flatten1([A|T], [A|U]) :-
    (    atom(A)
    ;    var(A)
    ),
    flatten1
