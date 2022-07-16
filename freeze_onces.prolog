:- use_module(library(freeze)).
:- use_module(library(tabling)).

:- table ones/1.
:- table ones1/1.

ones([1|T]) :-
    write("calling ones"), nl.
    freeze(T, ones(T)).

ones1([1,1,1,1]) :-
    write("calling ones1"), nl.
