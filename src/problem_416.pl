:- module(problem_416, [tree_string/2]).

:- use_module(library(dcgs)).

tree_string(T, S) :-
    phrase(tree_string(T), S).

tree_string(nil) -->
    "".
tree_string(t(A,nil,nil)) -->
    [A].
tree_string(t(A,B,C)) -->
    {  B = t(_, _, _), C = nil
    ;  B = t(_, _, _), C = t(_, _, _)
    ;  B = nil,        C = t(_, _, _)
    },
    [A],
    "(",
    tree_string(B),
    ",",
    tree_string(C),
    ")".
