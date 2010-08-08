#!/usr/bin/env ruby
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'rubygems'
require 'rbosa'

def open_app(name)
  puts %x[open "/Applications/#{name}.app"]
end

safari = OSA.app('Safari')

adium = OSA.app('Adium')
open_app('Gmail')

open_app('Gcal')
omni_focus = OSA.app('OmniFocus')

open_app('Utilities/Terminal')

text_mate = OSA.app('TextMate')

itunes = OSA.app('iTunes')

# safari = OSA.app('Safari')
# puts safari.methods.sort

