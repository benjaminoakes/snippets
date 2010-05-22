# Author: Benjamin Oakes <hello@benjaminoakes.com>

Dir.glob("**/*.pdf") do |pdf_file|
  puts("pdf_file: #{pdf_file.inspect}")
end

