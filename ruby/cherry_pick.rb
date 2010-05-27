#!/usr/bin/env ruby

# Cherry pick a list of Bazaar revisions.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

# NOTE Don't forget to push (or re-bind) once you're happy with the final output
system "bzr unbind"

BRANCH = 'TODO'

%w[434 431 430 429 428 427 426 425 424 423 422 421 417 416 415 365 363 362 360 359 358 356 347 331 327 321].reverse.each do |revno|
  puts "revno: #{revno}"
  puts

  system "bzr merge -c #{revno} #{BRANCH}"
  system "bzr ci -m 'Cherrypicked #{File.dirname(BRANCH)} r#{revno}'"

  puts
  puts "Press enter to continue."
  puts
  gets # You might have to resolve a merge by hand
end

