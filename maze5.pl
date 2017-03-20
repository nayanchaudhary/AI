%N=3 refugee boats, M = 1 not in distress, 2 in distress

  % % % %
% _ _ _ _ %
% _ D _ D %
% R _ _ _ %
% V _ _ B %
  % % % %

bump([_,1], south).
bump([_,4], north).
bump([1,_], west).
bump([4,_], east).

surfcrashing([1,1]).
surfcrashing([1,3]).
surfcrashing([2,2]).

seesboat([3,1]).
seesboat([4,2]).

criesandscreams([4,2]).
criesandscreams([4,4]).
criesandscreams([3,3]).
%criesandscreams([4,3]).

criesandscreams([2,2]).
criesandscreams([1,3]).
criesandscreams([2,4]).
criesandscreams([3,3]).