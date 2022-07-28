:- module(problem_416, [tree_string/2]).

:- use_module(library(dcgs)).

tree_string(T, S) :-
    phrase(tree_string(T), S).

tree_string(nil) -->
    "".
tree_string(t(A,nil,nil)) -->
    [A].
tree_string(t(A,t(B,C,D),nil)) -->
    [A],
    "(",
    tree_string(t(B,C,D)),
    ",",
    ")".
tree_string(t(A,nil,t(B,C,D))) -->
    [A],
    "(",
    ",",
    tree_string(t(B,C,D)),
    ")".
tree_string(t(A,t(B,C,D),t(E,F,G))) -->
    [A],
    "(",
    tree_string(t(B,C,D)),
    ",",
    tree_string(t(E,F,G)),
    ")".
