# Author: Benjamin Oakes <hello@benjaminoakes.com>

File.open(ARGV[0]) do |file|
  while line = file.gets
    if line.match(/^\s/)
      puts line.upcase
    else
      puts line
    end
  end
end

