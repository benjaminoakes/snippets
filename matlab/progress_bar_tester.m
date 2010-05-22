% To be used with code that supplies a progress_bar() function.  (Should be adding it soon if it's not here yet.)
% 
% Author: Benjamin Oakes <hello@benjaminoakes.com>
i = 0;

total=790;

while i <= total
  progress_bar(i, total);
  pause(0.1);
  i = i + 1;
end

