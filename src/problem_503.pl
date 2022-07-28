:- module(problem_503, [tree_signature/2]).

:- use_module(library(dcgs)).

tree_signature(T, S) :-
    phrase(tree_signature_(T), S).

tree_signature_(t(A, B)) -->
    [A],
    children_signature_(B),
    "^".

children_signature_([]) -->
    "".
children_signature_([A|T]) -->
    tree_signature_(A),
    children_signature_(T).
