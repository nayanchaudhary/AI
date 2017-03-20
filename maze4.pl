
  % % % %
% R R R R %
% R R R R %
% R R R R %
% D R R R %
  % % % %

% walls
bump([_,1], south).
bump([_,4], north).
bump([1,_], west).
bump([4,_], east).

surfcrashing(X).

criesandscreams([1,2]).
criesandscreams([2,1]).
%criesandscreams([1,1]).