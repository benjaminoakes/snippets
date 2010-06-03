% Author: Benjamin Oakes <hello@benjaminoakes.com>

file = fopen('myfile.txt', 'w');

% I want to output to STDOUT and the file.
s = 'Hello, world!\n';

fprintf(s);
fprintf(file, s);

fclose(file);

