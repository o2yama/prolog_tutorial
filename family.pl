father(takashi, taisei).
father(takahide, takashi).

ancester(X, Y):-
    father(X, Y).
ancester(X, Y):-
    father(X, Z), ancester(Z, Y).
