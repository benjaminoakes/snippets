# Author: Benjamin Oakes <hello@benjaminoakes.com>

task :default => :check_syntax

desc 'Check syntax of files.'
task :check_syntax do
  puts

  puts 'C:'
  puts
  system 'find c -name *.[ch] -exec gcc -fsyntax-only {} \;'
  puts

  puts 'HTML:'
  puts 
  system 'find html -name *.html -exec tidy -e {} \;'
  puts 

  puts 'Perl:'
  puts
  system 'for f in perl/*.pl; do perl -c $f; done'
  puts

  puts 'PHP:'
  puts
  system 'for f in php/*.php; do php --syntax-check $f; done'
  puts

  puts 'Ruby:'
  puts
  system 'ruby -c ruby/**/*.rb'
  puts

  # All the other languages I looked into seemed harder to syntax check.  (At least nothing stood out in the manpage or in a quick Google search.)
end

