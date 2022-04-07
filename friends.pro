likes(wacchi, cheese).
likes(gucci, cheese).
likes(weldone, sheep).

friends(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).
