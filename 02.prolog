list_last2([A,_], A).
list_last2([_,B,C|D], A) :- list_last2([B,C|D], A).
