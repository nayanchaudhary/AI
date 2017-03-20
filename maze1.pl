%Many paths,no obstructions

  % % % %
% _ _ _ D %
% _ _ _ _ %
% _ _ _ _ %
% V _ _ _ %
  % % % %

% walls
bump([_,1], south).
bump([_,4], north).
bump([1,_], west).
bump([4,_], east).

criesandscreams([3,4]).
criesandscreams([4,3]).

surfcrashing(X) :-
	false.
seesboat(X) :-
	false.