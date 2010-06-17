# Author: Benjamin Oakes <hello@benjaminoakes.com>

filename = ARGV[0]
filename.freeze

class String
  def each_char(&block)
    self.gsub(/./) do |char|
      yield char
    end
  end

  def self.ascii?(char)
    ascii_code = char[0]

    if ascii_code >= 0 && ascii_code <= 126
      return true
    else
      return false
    end
  end
end

File.open(filename) do |file|
  line_number = 0

  while line = file.gets
    line_number += 1
    
    line.each_char do |char|
      if !String.ascii?(char)
        puts "line_number: #{line_number}"
        puts "line: #{line}"
        puts "char: #{char}"
        puts "ASCII code: #{char[0]}"
        puts
      end
    end
  end
end

# # For testing
# non_ascii_string = "”"

