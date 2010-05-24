# Author: Benjamin Oakes <hello@benjaminoakes.com>

desc 'Check syntax of files.'
task :check_syntax do
  puts 'Ruby: '
  puts
  system 'ruby -c ruby/*.rb'
  puts

  puts 'Perl: '
  puts
  system 'for f in perl/*.pl; do perl -c $f; done'
  puts
end

