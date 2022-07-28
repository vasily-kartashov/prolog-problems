:- module(problem_503, [tree_signature/2]).

:- use_module(library(dcgs)).

tree_signature(T, S) :-
    phrase(tree_signature(T), S).

tree_signature(t(A, B)) -->
    [A],
    children_signature(B),
    "^".

children_signature([]) -->
    "".
children_signature([A|T]) -->
    tree_signature(A),
    children_signature(T).
