% No path

  % % % %
% _ _ _ D %
% _ _ _ _ %
% R _ _ _ %
% V R _ _ %
  % % % %

% walls
bump([_,1], south).
bump([_,4], north).
bump([1,_], west).
bump([4,_], east).

surfcrashing([1,1]).
surfcrashing([2,2]).
surfcrashing([1,3]).
surfcrashing([3,1]).

criesandscreams([3,4]).
criesandscreams([4,3]).
%criesandscreams([4,4]).