# Just a crazy idea I had.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

# ‘tmp’/'readme.txt’ # literals
# ROOT_DIR/file_path # variables holding strings
class String
  def /(str_to_join)
    File.join(self, str_to_join)
  end
end

user_name = 'ben'
home = '/Users'/user_name # => "/Users/ben"
documents = home/'Documents' # => "/Users/ben/Documents"
home/documents # => /Users/ben/Users/ben/Documents

