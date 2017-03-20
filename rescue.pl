%check boat in given block
boat([X, Y]) :-
	NNX is X - 1, NPX is X + 1, NNY is Y - 1, NPY is Y + 1,
	(seesboat([NNX, Y]); bump([X,Y], west)),
	(seesboat([NPX, Y]); bump([X,Y], east)),
	(seesboat([X, NNY]); bump([X,Y], south)),
	(seesboat([X, NPY]); bump([X,Y], north)).

%check rock in given block
rock([X, Y]) :-
  NNX is X - 1, NPX is X + 1, NNY is Y - 1, NPY is Y + 1,
	(surfcrashing([NNX, Y]); bump([X,Y], west)),
	(surfcrashing([NPX, Y]); bump([X,Y], east)),
	(surfcrashing([X, NNY]); bump([X,Y], south)),
	(surfcrashing([X, NPY]); bump([X,Y], north)).

%check if given block adjacent to boat in distress, and if yes is it facing the appropriate direction to deploy emily	
deploy_position([[X, Y],D]) :-
  NNX1 is X - 1, NNX2 is X - 2, NPX1 is X + 1, NPX2 is X + 2, NNY1 is Y - 1, NNY2 is Y - 2, NPY1 is Y + 1, NPY2 is Y + 2,
    (criesandscreams([X, Y])),
	((D = east,(criesandscreams([NPX2, Y]); bump([NPX1,Y], east)),(criesandscreams([NPX1, NPY1]); bump([NPX1,Y], north)),(criesandscreams([NPX1, NNY1]); bump([NPX1,Y], south)));
	(D = north,(criesandscreams([X, NPY2]); bump([X,NPY1], north)),(criesandscreams([NNX1, NPY1]);bump([X, NPY1], west)),(criesandscreams([NPX1, NPY1]); bump([X, NPY1], east)));
	(D = south,(criesandscreams([X, NNY2]); bump([X,NNY1], south)),(criesandscreams([NNX1, NNY1]); bump([X, NNY1], west)),(criesandscreams([NPX1, NNY1]); bump([X, NNY1], east)));
	(D = west,(criesandscreams([NNX2, Y]); bump([NNX1,Y], west)),(criesandscreams([NNX1, NPY1]); bump([NNX1,Y], north)),(criesandscreams([NNX1, NNY1]); bump([NNX1,Y], south)))).

%check if given block is safe
safe(X) :-
	not(boat(X)),
	not(rock(X)).

%movement actuations possible
forward([[X, Y], D], M, forward) :-
	(D = east, NX is X + 1, not(bump([X, Y], D)), safe([NX, Y]), M = [[NX, Y], D]);
	(D = north, NY is Y + 1, not(bump([X, Y], D)), safe([X, NY]), M = [[X, NY], D]);
	(D = south, NY is Y - 1, not(bump([X, Y], D)), safe([X, NY]), M = [[X, NY], D]);
	(D = west, NX is X - 1, not(bump([X, Y], D)), safe([NX, Y]), M = [[NX, Y], D]).

left([[X, Y], D], M, left) :-
	(D = east, M = [[X, Y], north]);
	(D = north, M = [[X, Y], west]);
	(D = west, M = [[X, Y], south]);
	(D = south, M = [[X, Y], east]).

right([[X, Y], D], M, right) :-
	(D = west, M = [[X, Y], north]);
	(D = north, M = [[X, Y], east]);
	(D = east, M = [[X, Y], south]);
	(D = south, M = [[X, Y], west]).

%possible moves in general
moves(X, M, S) :-
	(forward(X, M, S); right(X, M, S); left(X, M, S)).

%possible moves if current block is adjacent to distressed boat (hence no forward movement as you want to stay in that block and deploy emily)
moves1(X, M, S) :-
	(right(X, M, S); left(X, M, S)).
	
member(X, [X|_]).
member(X, [_|CL]) :-
	member(X, CL).

%for printing the location of distressed boat
output([[X,Y],D]):-
	NNX is X - 1, NPX is X + 1, NNY is Y - 1, NPY is Y + 1,
	((D = west, write([NNX,Y]), nl);
	(D = north, write([X,NPY]), nl);
	(D = east, write([NPX,Y]), nl);
	(D = south, write([X,NNY]), nl)).

%terminal condition
move([X,D], [], _, [deploy]) :-
	deploy_position([X,D]),
	output([X,D]),
	nl.
	
move([X, D], [M | P], CL, [S|F]) :-
	(criesandscreams(X), 
	moves1([X, D], M, S),
	not(member(M,CL)),
	move(M, P, [M|CL], F));
	(not(criesandscreams(X)),
	moves([X, D], M, S),
	not(member(M,CL)),
	move(M, P, [M|CL], F)).
	
findPath(F) :-
	X = [[1,1], north],
	move(X, _, [X], F).
	