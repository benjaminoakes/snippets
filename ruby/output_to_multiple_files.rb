# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'logger'

logger = Logger.new('test.log')
logger.info "hello!"

File.open("2.txt", "w") do |second|
  logger.info "whee!!!"
  second.puts "I'm in two"
  
  sleep 500
end

