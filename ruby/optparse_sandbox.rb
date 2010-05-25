# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'optparse'
require 'ostruct'

# # Simple:
# 
# options = {}
# 
# OptionParser.new do |opts|
#   opts.banner = "Usage: #{$PROGRAM_NAME} [options]"
# 
#   opts.on('-v', '--[no-]-verbose', "Run verbosely") do |verbose|
#     options[:verbose] = verbose
#   end
# end.parse!
# 
# p options
# p ARGV

# A little more complex:

PROGRAM_VERSION = '0.1'

class Options
  def self.parse(arguments)
    options = OpenStruct.new
    options.libraries = []
    
    option_parser = OptionParser.new do |o|
      o.banner = "Usage: #{$PROGRAM_NAME} [options]"
    
      o.on('-r', '--require LIBRARY', 'Require the LIBRARY before executing') do |library|
        options.libraries << library
      end

      o.on_tail('--help', 'Show these messages') do
        puts o
        exit
      end

      o.on_tail('--version', 'Show version') do
        puts "#{$PROGRAM_NAME} #{PROGRAM_VERSION}"
        exit
      end
    end

    option_parser.parse!(arguments)

    return options
  end
end

p Options.parse(ARGV)
# But it can't automatically stop when an option is required... ?  Am I missing something?

