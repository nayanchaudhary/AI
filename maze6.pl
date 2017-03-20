% N=2 refugee boats, all in distress

  % % % %
% _ _ _ _ %
% _ _ _ D %
% R _ _ _ %
% V _ _ D%
  % % % %

bump([_,1], south).
bump([_,4], north).
bump([1,_], west).
bump([4,_], east).

surfcrashing([1,1]).
surfcrashing([1,3]).
surfcrashing([2,2]).

criesandscreams([4,2]).
criesandscreams([4,4]).
criesandscreams([3,3]).
%criesandscreams([4,3]).

criesandscreams([3,1]).
criesandscreams([4,2]).
