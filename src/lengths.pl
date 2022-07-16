:- use_module(library(clpz)).

list_length1([], 0).
list_length1([_|T], N) :-
    N #> 0,
    N1 #= N - 1,
    list_length1(T, N1).

list_length2(A, N) :-
    N #>= 0,
    list_length2(A, 0, N).

list_length2([], N, N).
list_length2([_|T], I, N) :-
    I #< N,
    I1 #= I + 1,
    list_length2(T, I1, N).

list_length3(A, N) :-
    list_length3(A, 0, N).

list_length3([], N, N).
list_length3([_|T], I, N) :-
    I1 is I + 1,
    list_length3(T, I1, N).

list_length4([], 0).
list_length4([_|T], N) :-
    list_length4(T, N0),
    N is N0 + 1.
