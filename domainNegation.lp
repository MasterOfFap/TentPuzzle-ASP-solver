:- tentToTree(X,Y,_,_), tentToTree(X+1,Y,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X-1,Y,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X,Y+1,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X,Y-1,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X+1,Y+1,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X-1,Y-1,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X+1,Y-1,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X-1,Y+1,_,_).
:- tentToTree(X,Y,_,_), tree(X,Y).

-tentToTree(X,Y) :- not tree(X,Y), not tree(X,Y+1), not tree(X,Y-1), not tree(X+1,Y), not tree(X-1,Y), line(X), column(Y).

aux(W+1,Z,W,Z) :-  not -tentToTree(W+1,Z), tree(W,Z), rowsum(W+1,N), N > 0.
aux(W-1,Z,W,Z) :-  not -tentToTree(W-1,Z), tree(W,Z), rowsum(W-1,N), N > 0.
aux(W,Z+1,W,Z) :-  not -tentToTree(W,Z+1), tree(W,Z), colsum(Z+1,N), N > 0.
aux(W,Z-1,W,Z) :-  not -tentToTree(W,Z-1), tree(W,Z), colsum(Z-1,N), N > 0.

1{tentToTree(X,Y,W,Z): aux(X,Y,W,Z)}1 :- tree(W,Z).

rowCompleted(X) :- line(X), N = #count{Y : tentToTree(X,Y,_,_)}, rowsum(X,N).
columnCompleted(Y) :- column(Y), N = #count{X : tentToTree(X,Y,_,_)}, colsum(Y,N).

checkRows(N) :- N = #count{X : rowCompleted(X)}.
checkColumn(N) :- N = #count{Y : columnCompleted(Y)}.
total(N+M) :- checkRows(N), checkColumn(M).

#maximize {N: total(N)}.

#show tentToTree/4.
#show total/1.
