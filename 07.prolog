list_flatten([], []).
list_flatten([[]|T], B) :- list_flatten(T, B).
list_flatten([A|T], B)
