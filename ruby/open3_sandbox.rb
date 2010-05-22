# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'open3'

Open3.popen3('irb < /dev/null') do |stdin, stdout, stderr|
  loop do
    puts stdout.gets
    # puts stderr.gets
    # stdin.puts $stdin.gets
  end
end

