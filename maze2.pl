

  % % % %
% _ _ _ _ %
% _ D _ _ %
% R _ _ _ %
% V _ B _ %
  % % % %

% walls
bump([_,1], south).
bump([_,4], north).
bump([1,_], west).
bump([4,_], east).

surfcrashing([1,1]).
surfcrashing([1,3]).
surfcrashing([2,2]).

%surfcrashing([3,3]).
%surfcrashing([3,1]).
%surfcrashing([4,2]).

seesboat([2,1]).
seesboat([3,2]).
seesboat([4,1]).

criesandscreams([2,2]).
criesandscreams([2,4]).
criesandscreams([1,3]).
criesandscreams([3,3]).

