/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Prolog stream/lazy list demonstration

   Written 2005, 2015, 2020 by Markus Triska (triska@metalevel.at)
   Public domain code. Tested with Scryer Prolog.

   For more information, visit:

                https://www.metalevel.at/various/prost
                ======================================
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

:- use_module(library(clpz)).
:- use_module(library(dcgs)).

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Sequence interface predicates.

   A sequence Seq is represented as a term of the form:

               seq(Car, Cdr)

   Car is the first element of Seq in its current state. Cdr is called
   with one additional argument to obtain a representation of Seq when
   its first element is removed, reflecting the new state of Seq.

   car_cdr_seq/3 relates a sequence to these components.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

car_cdr_seq(Car, Cdr, seq(Car,Cdr)).

seq_car(Seq, Car) :- car_cdr_seq(Car, _, Seq).

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   seq_next(+Seq0, -Seq)

   True iff Seq is Seq0 without its first element.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

seq_next(Seq0, Seq) :-
        car_cdr_seq(_, Cdr0, Seq0),
        call(Cdr0, Seq).

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   seq_take(+Seq, +N, ?Ts)

   True iff Ts is the list of the first N elements of Seq.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

seq_take(Seq, N, Ts) :- phrase(seq_take_(Seq, N), Ts).

seq_take_(0, _) --> !.
seq_take_(N0, Seq0) --> [Car],
         { seq_car(Seq0, Car),
           seq_next(Seq0, Seq),
           N #= N0 - 1 },
         seq_take_(N, Seq).

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   seq_filter(+Pred, +Seq0, -Seq)

   True iff Seq is the sequence of all elements of Seq0 for which the
   predicate Pred holds.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

seq_filter(Pred, Seq0, Seq) :-
        seq_car(Seq0, Car),
        seq_next(Seq0, Seq1),
        (   call(Pred, Car) ->
            car_cdr_seq(Car, seq_filter(Pred,Seq1), Seq)
        ;   seq_filter(Pred, Seq1, Seq)
        ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Examples.

   We also show sample queries that ask for a few sequence elements.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */


/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Stream of 1s.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

ones(Seq) :- car_cdr_seq(1, ones, Seq).

%?- ones(Os), seq_take(7, Os, Ts).
%@ Os = seq(1, ones),
%@ Ts = [1, 1, 1, 1, 1, 1, 1].

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Pairwise addition of two sequences.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

seq_add(SeqA, SeqB, SeqAdd) :-
        seq_car(SeqA, CarA),
        seq_car(SeqB, CarB),
        Car #= CarA + CarB,
        seq_next(SeqA, SeqANext),
        seq_next(SeqB, SeqBNext),
        car_cdr_seq(Car, seq_add(SeqANext,SeqBNext), SeqAdd).

%?- ones(Ones), seq_add(Ones, Ones, Ls), seq_take(5, Ls, Ts).
%@    Ls = seq(2,seq_add(seq(1,ones),seq(1,ones))), Ones = seq(1,ones), Ts = [2,2,2,2,2]
%@ ;  false.

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   List patterns: [1,2..], [1,5..], [-3,-6..] etc.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

lp(First, Second, Seq) :-
        Diff #= Second - First,
        Third #= Second + Diff,
        car_cdr_seq(First, lp(Second,Third), Seq).

%?- lp(-5, 2, Ls), seq_take(10, Ls, Ts).
%@    Ls = seq(-5,lp(2,9)), Ts = [-5,2,9,16,23,30,37,44,51,58]
%@ ;  false.

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Stream of primes, using the sieve of Eratosthenes.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

primes(Ps) :-
        lp(2, 3, Seq),
        sieve(Seq, Ps).

sieve(Seq0, Seq) :-
        seq_car(Seq0, Car),
        seq_filter(not_divisible_by(Car), Seq0, Seq1),
        car_cdr_seq(Car, sieve(Seq1), Seq).

not_divisible_by(By, D) :- D mod By #\= 0.

%?- primes(Ps), seq_take(15, Ps, Ts).
%@    Ps = seq(2, ...), Ts = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47]
%@ ;  false.


/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Sequence of Fibonacci numbers.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

fibs(Seq) :- fib(0, 1, Seq).

fib(A, B, Seq) :-
        C #= A + B,
        car_cdr_seq(A, fib(B,C), Seq).

%?- fibs(Fs), seq_take(12, Fs, Ts).
%@    Fs = seq(0,fib(1,1)), Ts = [0,1,1,2,3,5,8,13,21,34,55,89]
%@ ;  false.

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Harmonic sequence.

   Uses Scryer Prolog's built-in support for rational numbers.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

harms(Seq) :- harmonic(1, Seq).

harmonic(N0, Seq) :-
        First is 1 rdiv N0,
        N #= N0 + 1,
        car_cdr_seq(First, harmonic(N), Seq).

%?- harms(Hs), seq_take(6, Hs, Ts).
%@    Hs = seq(1,harmonic(2)), Ts = [1,1/2,1/3,1/4,1/5,1/6]
%@ ;  false.
