list_duplicated([], []).
list_duplicated([A|T], [A,A|U]) :- list_duplicated(T, U).
