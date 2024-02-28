:- tentToTree(X,Y,_,_), tentToTree(X+1,Y,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X-1,Y,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X,Y+1,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X,Y-1,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X+1,Y+1,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X-1,Y-1,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X+1,Y-1,_,_).
:- tentToTree(X,Y,_,_), tentToTree(X-1,Y+1,_,_).
:- tentToTree(X,Y,_,_), tree(X,Y).


tentToTree(2,Y,1,Y) | tentToTree(1,Y+1,1,Y) | tentToTree(1,Y-1,1,Y) :- tree(1,Y).
tentToTree(X,2,X,1) | tentToTree(X+1,1,X,1) | tentToTree(X-1,1,X,1) :- tree(X,1).
tentToTree(X-1,Y,X,Y) | tentToTree(X,Y-1,X,Y) | tentToTree(X,Y+1,X,Y):- tree(X,Y), lines(X).
tentToTree(X,Y-1,X,Y) | tentToTree(X-1,Y,X,Y) | tentToTree(X+1,Y,X,Y):- tree(X,Y), columns(Y).
tentToTree(X+1,Y,X,Y) | tentToTree(X-1,Y,X,Y) | tentToTree(X,Y+1,X,Y) | tentToTree(X,Y-1,X,Y) :- tree(X,Y).


rowCompleted(X) :- line(X), N = #count{Y : tentToTree(X,Y,_,_)}, rowsum(X,N).
columnCompleted(Y) :- column(Y), N = #count{X : tentToTree(X,Y,_,_)}, colsum(Y,N).

checkRows(N) :- N = #count{X : rowCompleted(X)}.
checkColumn(N) :- N = #count{Y : columnCompleted(Y)}.
total(N+M) :- checkRows(N), checkColumn(M).

#maximize {N: total(N)}.

#show tentToTree/4.
#show total/1.
