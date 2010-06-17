# Something like this is only really useful if you're on Windows.  On *nix, you're probably better off doing:
# 
#     $ find . -name *.pdf -print
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

Dir.glob("**/*.pdf") do |pdf_file|
  puts("pdf_file: #{pdf_file.inspect}")
end

