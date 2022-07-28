:- module(problme_506, [tree_ltl/2]).

:- use_module(library(dcgs)).

tree_ltl(T, L) :-
    phrase(tree_ltl(T), L).

tree_ltl(t(A, [])) --> [A].
tree_ltl(t(A, [B|T])) --> "(", [A], " ", children_ltl([B|T]), ")".

children_ltl([]) --> "".
children_ltl([A]) --> tree_ltl(A).
children_ltl([B,C|T]) --> tree_ltl(B), " ", children_ltl([C|T]).
