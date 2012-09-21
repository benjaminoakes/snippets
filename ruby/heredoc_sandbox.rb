# Author: Benjamin Oakes <hello@benjaminoakes.com>

if true
  # The minus sign makes it so that you don't have to end the heredoc at column 1.
  puts <<-eos
Hello, world!
  eos
end
