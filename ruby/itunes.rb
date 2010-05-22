# Control iTunes through Ruby (on OS X).
# 
# See also http://rubyosa.rubyforge.org/
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'rubygems'
require 'rbosa'

itunes = OSA.app("iTunes")
itunes.next_track
p itunes.current_track.name
p itunes.current_track.artist

